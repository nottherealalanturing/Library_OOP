class Book
  attr_accessor :title, :book, :rentals

  def initialize(title, book)
    @title = title
    @book = book
    @rentals = []
  end

  def add_rental(date, person)
    Rental.new(date, self, person)
  end
end
