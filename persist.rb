require 'json'

module Persist
    def save_books(books)
        books_array = []
        books.each do |book|
            books_array << {title: book.title, author: book.author, book_id: book.book_id}
        end
        File.write("books.json",  books_array , mode: "w")
    end

    def save_people(people)
        people_array = []
        people.each do |person|
            people_array << {
                type: person.class.to_s,
                age: person.age,
                person_id: person.id,
                name: person.name,
                permission: person.permission,
                specialization: person.specialization
            }         
        end
        File.write("people.json",  people_array, mode: "w")
    end

    def save_rentals(rentals)
        rentals_array = []
        rentals.each do |rental|
            rentals_array << {
                person_id: rental.person.id,
                book_id: rental.book.id,
                date: rental.date
            }
        end
        File.write("rentals.json",  rentals_array, mode: "w")
    end

end
