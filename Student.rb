require './Person'

class Student < Person
    attr_accessor :classroom
  def initialize(classroom, age, name = 'unknown', parent_permision = true)
    super(age, parent_permision, name)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
