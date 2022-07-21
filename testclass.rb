require './person'
require './book'
require './rental'
require './classroom'
require './student'

=begin 
classroom_1 = Classroom.new("class 1")
classroom_2 = Classroom.new("class 2")

student_1 = Student.new(classroom_1, 25, "false", "Assad")

puts "before"
puts "class 1"
classroom_1.students.each do |student|
    puts student.name
end

puts "class 2"
classroom_2.students.each do |student|
    puts student.name
end

classroom_2.add_student(student_1)
puts "after"

puts "class 1"
classroom_1.students.each do |student|
    puts student.name
end

puts "class 2"
classroom_2.students.each do |student|
    puts student.name
end
=end
=begin 
    person_1= Person.new(22, 'maximilianus')
    person_2 = Person.new(22, 'papandrious')

    book_1 = Book.new("To kill a mockingbird", '1')
    book_2 = Book.new("The Great Gatsby", '2')

    rental_1 = Rental.new("2017-12-22", book_1, person_1)
    rental_2 = Rental.new("2027-22-22", book_1, person_2 )
    rental_3 = Rental.new("2027-22-22", book_2, person_2 )

    puts book_1.rentals.count
    puts book_2.rentals.count
    book_1.rentals.map {|rental| puts rental.date}

    person_1.rentals.count
    person_1.rentals.map {|rental| puts rental.book.title}

    person_2.rentals.count
    person_2.rentals.map {|rental| puts rental.book.title} 
=end
