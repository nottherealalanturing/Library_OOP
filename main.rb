require './person'
require './book'
require './rental'
require './classroom'
require './student'
require './teacher'

class App
    def initialize
        @books = []    
        @people = []
        @rentals = []
    end

    def list_all_books
        if @books.empty?
            puts "Book's database is empty, please add a book"
        else
            @books.each_with_index do |book, index|
                puts "#{index}) Title: \"#{book.title}\", Author: \"#{book.author}\" "
            end
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
        age, person, name, permission, newstudent, newteacher = nil
        
        puts "Do you want to create a student (1) or a teacher (2)? [Input the number]:"
        person = gets.chomp until person == "1" || person == "2"

        if person == "1" 
            print "Age: "
            age = gets.chomp

            print "Name: "
            name = gets.chomp.downcase

            print "Has parent permission? [Y/N]: "
            permission = gets.chomp.downcase
        elsif person == "2"
            print "Age: "
            age = gets.chomp

            print "Name: "
            name = gets.chomp.downcase

            print "Specialization: "
            specialization = gets.chomp.downcase
        else
            return "Invalid input"
        end

        permission == "y" ? permission = "true": permission = "false"
        if person == "1"
            newstudent = Student.new(age, permission,name)
            if @people.include?(newstudent)
                puts "Student already in database"
            else
                @people.push(newstudent)
                puts "Person created successfully"
            end
        else
            newteacher = Teacher.new(specialization, age, name, permission)
            if @people.include?(newteacher)
                puts "Teacher already in database"
            else
                @people.push(newteacher)
                puts "Person created successfully"
            end
        end
    end

    def create_book
        age, person, name, permission, newstudent, newteacher = nil
        
        print "Title: "
        title = gets.chomp

        print "Author: "
        author = gets.chomp

        puts ""

        newbook = Book.new(title, author)
        
        if @books.include?(newbook)
            puts "Book already in database"
        else
            @books.push(newbook)
            puts "Book created successfully"
        end
    end

    def create_rental
        if @people.empty? || @books.empty?
            puts 'Either of your Library is empty' 
            return
        end
        puts "Select a book from the following list by number"
        
        @books.each_with_index do |book, index|
            puts "#{index}) Title: \"#{book.title}\", Author: \"#{book.author}\" "
        end

        book_index = gets.chomp.to_i
        book = @books[book_index]

        puts "Select a person from the following list by number (not ID)"
        @people.each_with_index do |person, index|
            print "#{index}) [#{person.class}] Name: #{person.name.capitalize}, ID: #{person.id}, Age: #{person.age}\n"
        end
        person_index = gets.chomp.to_i
        person = @people[person_index]

        print "Date: "
        date = gets.chomp

        rental = Rental.new(date, book, person);
        @rentals.push(rental)
        puts "Rental created successfully"
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
    
        rentals.each do |rental|
          print "Date: #{rental.date}, Book \'#{rental.book.title}\' by #{rental.book.author}\n"
        end
      end


    def run
        puts "Welcome to School Library App!"
        puts ""
        puts "Please choose an option by entering a number:"
        puts "1 - List all books"
        puts "2 - List all people"
        puts "3 - Create a person"
        puts "4 - Create a book"
        puts "5 - Create a rental"
        puts "6 - List all rentals for a given person id"
        puts "7 - Exit"

        start_function = gets.chomp
        
        until start_function == "7"
            case start_function
            when "1"
                list_all_books
            when "2"
                list_all_people
            when "3"
                create_person
            when "4"
                create_book
            when "5"
                create_rental
            when "6"
                list_rentals
            else
                puts "Invalid Input" 
            end
            
            puts "Welcome to School Library App!"
            puts ""
            puts "Please choose an option by entering a number:"
            puts "1 - List all books"
            puts "2 - List all people"
            puts "3 - Create a person"
            puts "4 - Create a book"
            puts "5 - Create a rental"
            puts "6 - List all rentals for a given person id"
            puts "7 - Exit"
            start_function = gets.chomp
        end
            
    end
end

def main
    app = App.new()
    app.run()
end

main()