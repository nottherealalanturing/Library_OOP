require "./person.rb"
require "./student.rb"
require "./teacher.rb"

person = Person.new(25, false, 'Person')
student = Student.new('classroom 1', 40, 'Student', true)
teacher = Teacher.new("Teacher", 30, "science",  true)

puts "person #{person.name}"
puts "student #{student.name}"
puts "teacher #{teacher.name}"