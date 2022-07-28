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

    
end
