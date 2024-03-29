require 'json'
require 'fileutils'
require './book'

class Persist
  def self.save_books(books)
    books_array = []
    books.each do |book|
      books_array << { title: book.title, author: book.author, book_id: book.book_id || '' }
    end
    FileUtils.mkdir_p('./database/') unless File.exist?('./database/books.json')
    File.write('./database/books.json', JSON.generate(books_array), mode: 'w')
  end

  def self.save_people(people)
    people_array = []
    people.each do |person|
      people_array << {
        type: person.class.to_s,
        age: person.age,
        person_id: person.id,
        name: person.name,
        permission: (person.class.to_s == 'Student' ? person.parent_permision : ''),
        specialization: (person.class.to_s == 'Teacher' ? person.specialization : '')
      }
    end
    FileUtils.mkdir_p('./database/') unless File.exist?('./database/people.json')
    File.write('./database/people.json', JSON.generate(people_array), mode: 'w')
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
    FileUtils.mkdir_p('./database/') unless File.exist?('./database/rentals.json')
    File.write('./database/rentals.json', JSON.generate(rentals_array), mode: 'w')
  end

  def self.load_books
    books = []
    if File.exist?('./database/books.json')
      books_json = File.read('./database/books.json')
      books_data = JSON.parse(books_json)

      books_data.each do |book|
        temp = Book.new(book['title'], book['author'])
        temp.book_id = (book['book_id'])
        books << temp
      end
    end
    books
  end

  def self.load_people
    people = []
    if File.exist?('./database/people.json')
      people_json = File.read('./database/people.json')
      people_data = JSON.parse(people_json)

      people_data.each do |person|
        temp = if person['type'] == 'Student'
                 Student.new(person['age'], person['parent_permision'], person['name'])
               else
                 Teacher.new(person['specialization'], person['age'], person['name'], person['permission'])
               end
        temp.id = (person['person_id'])
        people.push(temp)
      end
    end
    people
  end

  def self.load_rentals(people, books)
    rentals = []
    if File.exist?('./database/rentals.json')
      rental_json = File.read('./database/rentals.json')
      rental_data = JSON.parse(rental_json)

      rental_data.each do |rental|
        temp_book = book?(books, rental['book_id'])
        temp_person = person?(people, rental['person_id'])
        unless temp_book == -1 || temp_person == -1
          rentals << Rental.new(rental['date'], books[temp_book], people[temp_person])
        end
      end
    end
    rentals
  end

  def self.book?(books, id)
    books.each_with_index do |book, index|
      return index if book.book_id == id
    end
    -1
  end

  def self.person?(people, id)
    people.each_with_index do |person, index|
      return index if person.id == id
    end
    -1
  end
end
