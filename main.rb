require './app'
require './persist'

def prompts
  puts 'Welcome to School Library App!'
  puts ''
  puts 'Please choose an option by entering a number:'
  puts '1 - List all books'
  puts '2 - List all people'
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Create a rental'
  puts '6 - List all rentals for a given person id'
  puts '7 - Exit'
end

def prompter(input, app)
  case input
  when '1'
    app.list_all_books
  when '2'
    app.list_all_people
  when '3'
    app.create_person
  when '4'
    app.create_book
  when '5'
    app.create_rental
  when '6'
    app.list_rentals
  else
    puts ''
  end
end

def loadData
  persist = Persist.new
  books = persist.load('books')
  people = persist.load('people')
  rentals = persist.load('rentals')
  return [books, people, rentals]
end

def saveData(app)
  persist = Persist.new
  books = persist.sav('books', app.books)
  people = persist.load('people', app.people)
  rentals = persist.load('rentals', app.rentals)
end

def main
  response = nil
  books, people, rentals = loadData
  app = App.new(books, people, rentals)
  
  until response == '7'
    prompts
    response = gets.chomp
    prompter(response, app)
  end
  puts saveData(app)
  
end

main
