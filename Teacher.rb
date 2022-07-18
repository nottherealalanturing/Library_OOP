require './Person'

class Teacher < Person
  def initialize(age, parent_permision, specialization, name = 'unknown')
    super(name, age, parent_permision)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
