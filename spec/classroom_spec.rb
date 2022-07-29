require_relative '../student'
require_relative '../classroom'

RSpec.describe Classroom do
  before(:all) do
    @student1 = Student.new(20, 'false', 'Man')
    @classroom = Classroom.new('First Grade')
  end
  context 'when a new classroom is created' do
    it 'should be an instance of classroom' do
      expect(@classroom).to be_instance_of Classroom
    end

    it 'should have a label attribute' do
      expect(@classroom).to have_attributes(label: 'First Grade')
    end

    it 'should have a student attribute' do
      expect(@classroom).to have_attributes(students: [])
    end

    it 'should add student to classroom' do
      @classroom.add_student(@student1)
      expect(@classroom.students.length).to eq 1
    end
  end
end
