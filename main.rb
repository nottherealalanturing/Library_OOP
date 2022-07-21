class App
    include './person'
    include './book'
    include './rental'
    include './classroom'
    include './student'
    
    def initialize
        @books = []    
        @people = []
    end

    def list_all_books
        if @books.count == 0
            puts "Book's database is empty, please add a book"
        else
            @books.each do |book|
                puts "Title: \"#{book.title}\", Author: \"#{book.author}\" "
            end
        end
    end

    def list_all_people
        if @people.count == 0
            puts "People's database is empty, please add a person"
        else
            @people.each do |person|
                if person.instance_of? Student
                    puts "[Student] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
                elsif person.instance_of? Teacher
                    puts "[Teacher] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
                else
                    puts "Invalid input"
                end
            end
        end
    end

    def create_person
        age, person, name, permission, newstudent, newteacher = nil
        
        puts "Do you want to create a student (1) or a teacher (2)? [Input the number]:"
        person = gets.chomp until person == "1" || person == "2"

        if person == "1" 
            puts "Age: "
            age = gets.chomp

            puts "Name: "
            name = gets.chomp.downcase

            puts "Has parent permission? [Y/N]: "
            permission = gets.chomp.downcase
        elsif person == "2"
            puts "Age: "
            age = gets.chomp

            puts "Name: "
            name = gets.chomp.downcase

            puts "Specialization: "
            specialization = gets.chomp.downcase
        else
            return "Invalid input"
        end

        permission == "y" ? permission = "true": permission = "false"
        if person == "1"
            newstudent = Student.new(age, permission,name)
        else
            newteacher = Teacher.new(specialization, age, name, permission)
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
            puts "assad"
            start_function = gets.chomp
        end
            
    end
end

def main
    app = App.new()
    app.run()
end

main()