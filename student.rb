require './person'

class Student < Person
  attr_accessor :classroom

  def initialize(classroom, age, parent_permision = 'true', name = 'unknown')
    super(age, name, parent_permision)
    classroom.add_student(self)
    #@classroom = classroom
    #classroom.students.push(student) unless classroom.students.include?(student)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
