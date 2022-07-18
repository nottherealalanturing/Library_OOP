require './Person'

class Student < Person
  attr_accessor :classroom

  def initialize(classroom, age, parent_permision, name = 'unknown')
    super(age, parent_permision, name)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
