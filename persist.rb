require 'json'
require './book'

class Persist
    
    def self.save_books(books)
        books_array = []
        books.each do |book|
            books_array << {title: book.title, author: book.author, book_id: book.book_id || ""}
        end
        File.write("./database/books.json",  JSON.generate(books_array) , mode: "w")
    end

    def self.save_people(people)
        people_array = []
        people.each do |person|
            people_array << {
                type: person.class.to_s,
                age: person.age,
                person_id: person.id,
                name: person.name,
                permission: (person.class.to_s == "Student" ? person.parent_permision : ""),
                specialization: (person.class.to_s == "Teacher" ? person.specialization : "")
            }         
        end
        File.write("./database/people.json",  JSON.generate(people_array), mode: "w")
    end

    def self.save_rentals(rentals)
        rentals_array = []
        rentals.each do |rental|
            rentals_array << {
                person_id: rental.person.id,
                book_id: rental.book.book_id,
                date: rental.date
            }
        end
        File.write("./database/rentals.json",  JSON.generate(rentals_array), mode: "w")
    end

    def self.load_books
        books = []
        if File.exists?("./database/books.json")
            books_json = File.read("./database/books.json")
            books_data = JSON.parse(books_json)

            books_data.each do |book|
                temp = Book.new(book.title, book.author)
                temp.id=(book.id)
                books << temp
            end
        end
        books
    end
    
    def self.load_people
        people = []
        if File.exists?("./database/people.json")
            people_json = File.read("./database/people.json")
            people_data = JSON.parse(people_json)

            people_data.each do |person|
                if person.class.to_s == "Student"
                    people << Student.new(person.age, person.parent_permision, person.name)
                else
                    people << Teacher.new(person.specialization, person.age, person.name, person.permission)
                end
            end
        end
        people
    end

    def self.load_rentals(people, books)
        rentals = []
        if File.exists?("./database/rentals.json")
            rental_json = File.read("./database/rentals.json")
            rental_data = JSON.parse(rental_json)

            rental_data.each do |rental|
                temp_book = isBook?(books, rental.book_id) 
                temp_person = isPerson?(people, rental.person_id)
                unless temp_book == -1 || temp_person == -1
                    rentals << Rental.new(rental.date, book[temp_book], person[temp_person])
                end
            end
        end
        return rentals
    end

    private

    def isBook?(books, id)
        books.each_with_index do |book, index|
           return index if book.book_id == id
        end
        -1
    end

    def isPerson?(people, id)
        people.each_with_index do |person|
           return true if person.id == id
        end
        -1
    end

end
