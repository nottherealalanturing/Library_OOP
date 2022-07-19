require './person'

class Student < Person
  attr_accessor :classroom

  def initialize(classroom, age, parent_permision = 'true', name = 'unknown')
    super(age, name, parent_permision)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end