require './Person'

class Student < Person
  def initialize(age, parent_permision, classroom, name = 'unknown')
    super(name, age, parent_permision)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
