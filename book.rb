class Book
  attr_accessor :title, :author, :rentals, :book_id

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = [] 
    @book_id = Random.rand(1..500);
  end

  def add_rental(date, person)
    Rental.new(date, self, person)
  end
end
