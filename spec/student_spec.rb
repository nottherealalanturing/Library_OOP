require_relative '../student'

RSpec.describe Student do
  before(:all) do
    @student = Student.new(20, 'false', 'Adam')
  end

  context 'when condition new student is created' do
    it 'should be an instance Student class' do
      expect(@student).to be_instance_of Student
    end

    it 'should have an play_hooky method' do
      expect(@student).to respond_to(:play_hooky)
    end
  end
end
