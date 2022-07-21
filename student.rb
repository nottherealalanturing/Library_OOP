require './person'

class Student < Person
  attr_accessor :classroom

  def initialize(age, parent_permision = 'true', name = 'unknown', classroom = nil)
    @classroom = classroom
    unless classroom.nil?
      (classroom.students.push(self) unless classroom.students.include?(self)) 
    end
    super(age, name, parent_permision)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
