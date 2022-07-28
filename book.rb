class Book
  attr_accessor :title, :author, :rentals, :book_id

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = [] 
    @book_id = nil;
  end

  def add_rental(date, person)
    Rental.new(date, self, person)
  end
end
