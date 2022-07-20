require './person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(specialization, age, name = 'unknown', parent_permision = 'true')
    super(age, name, parent_permision)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
