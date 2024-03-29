require './person'
require './book'
require './rental'
require './classroom'
require './student'
require './teacher'
require './persist'

class App
  attr_reader :books, :people, :rentals

  def initialize()
    @books = Persist.load_books
    @people = Persist.load_people
    @rentals = Persist.load_rentals(@people, @books)
  end

  def list_all_books
    if @books.empty?
      puts "Book's database is empty, please add a book"
    else
      @books.each_with_index { |book, index| puts %(#{index}\) Title: "#{book.title}", Author: "#{book.author}" ) }
    end
  end

  def list_all_people
    if @people.empty?
      puts "People's database is empty, please add a person"
    else
      @people.each_with_index do |person, index|
        puts "#{index}) [#{person.class}] Name: #{person.name.capitalize}, ID: #{person.id}, Age: #{person.age}\n"
      end
    end
  end

  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]:'
    person = gets.chomp until %w[1 2].include?(person)
    case person
    when '1'
      print 'Age: '
      age = gets.chomp
      print 'Name: '
      name = gets.chomp.capitalize
      print 'Has parent permission? [Y/N]: '
      permission = gets.chomp.downcase
      newstudent = Student.new(age, permission, name)
      if @people.include?(newstudent)
        puts 'Student already in database'
      else
        @people.push(newstudent)
        puts 'Person created successfully'
      end
    when '2'
      print 'Age: '
      age = gets.chomp
      print 'Name: '
      name = gets.chomp.capitalize
      print 'Specialization: '
      specialization = gets.chomp.capitalize
      newteacher = Teacher.new(specialization, age, name, permission)
      if @people.include?(newteacher)
        puts 'Teacher already in database'
      else
        @people.push(newteacher)
        puts 'Person created successfully'
      end
    else
      'Invalid input'
    end
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    puts ''
    newbook = Book.new(title, author)
    if @books.include?(newbook)
      puts 'Book already in database'
    else
      @books.push(newbook)
      puts 'Book created successfully'
    end
  end

  def create_rental
    if @people.empty? || @books.empty?
      puts 'Either of your Library is empty'
    else
      puts 'Select a book from the following list by number'
      @books.each_with_index { |book, index| puts %(#{index}\) Title: "#{book.title}", Author: "#{book.author}" ) }
      book_index = gets.chomp.to_i
      book = @books[book_index]
      puts 'Select a person from the following list by number (not ID)'
      @people.each_with_index do |person, index|
        print "#{index}) [#{person.class}] Name: #{person.name.capitalize}, ID: #{person.id}, Age: #{person.age}\n"
      end
      person_index = gets.chomp.to_i
      person = @people[person_index]
      print 'Date: '
      date = gets.chomp
      rental = Rental.new(date, book, person)
      @rentals.push(rental)
      puts 'Rental created successfully'
    end
  end

  def list_rentals
    print 'ID of person: '
    id = gets.chomp.to_i
    puts 'Rentals: '
    rentals = @rentals.select { |rental| rental.person.id == id }
    if rentals.empty?
      puts 'No rentals found'
      return
    end
    rentals.each { |rental| print %(Date: #{rental.date}, Book "#{rental.book.title}" by #{rental.book.author}\n") }
  end
end
