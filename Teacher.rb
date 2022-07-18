require './Person'

class Teacher < Person
  attr_accessor :specialization
  def initialize(specialization, age, name = 'unknown', parent_permision = true)
    super(age, parent_permision, name)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
