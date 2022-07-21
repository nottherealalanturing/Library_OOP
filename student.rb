require './person'

class Student < Person
  attr_accessor :classroom

  def initialize(age, parent_permision = 'true', name = 'unknown', classroom = nil)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
    super(age, name, parent_permision)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
