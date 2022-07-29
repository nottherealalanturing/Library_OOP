require_relative '../teacher'

RSpec.describe Teacher do
  before(:all) do
    @teacher = Teacher.new('Mathematics', 20, 'FakeTeacher')
  end

  context 'when a new Teacher is created' do
    it 'should be an instance teacher class' do
      expect(@teacher).to be_instance_of Teacher
    end

    it 'should have an can_use_services method' do
      expect(@teacher).to respond_to(:can_use_services?)
    end
  end
end
