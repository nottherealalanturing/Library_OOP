require './person'
require './book'
require './rental'
require './classroom'
require './student'

classroom1 = Classroom.new('class 1')
classroom2 = Classroom.new('class 2')

student1 = Student.new(25, 'false', 'Assad', classroom1)

puts 'before'
puts 'class 1'
classroom1.students.each do |student|
  puts student.name
end

puts 'class 2'
classroom2.students.each do |student|
  puts student.name
end

classroom2.add_student(student1)
puts 'after'

puts 'class 1'
classroom1.students.each do |student|
  puts student.name
end

puts 'class 2'
classroom2.students.each do |student|
  puts student.name
end

person1 = Person.new(22, 'maximilianus')
person2 = Person.new(22, 'papandrious')

book1 = Book.new('To kill a mockingbird', '1')
book2 = Book.new('The Great Gatsby', '2')

Rental.new('2017-12-22', book1, person1)
Rental.new('2027-22-22', book1, person2)
Rental.new('2027-22-22', book2, person2)

puts book_1.rentals.count
puts book2.rentals.count
book_1.rentals.map { |rental| puts rental.date }

person1.rentals.count
person1.rentals.map { |rental| puts rental.book.title }

person2.rentals.count
person2.rentals.map { |rental| puts rental.book.title }
