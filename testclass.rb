require './person'
require './student'
require './teacher'

person = Person.new(25, false, 'Person')
student = Student.new('classroom 1', 40, true, 'Student')
teacher = Teacher.new('Teacher', 30, 'science')

puts "person #{person.name}"
puts "student #{student.name}"
puts "teacher #{teacher.name}"
