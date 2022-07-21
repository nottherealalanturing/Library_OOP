class Book
    attr_accessor :title, :book, :rentals
    def initialize(title, book)
        @title = title
        @book = book
        @rentals = []
    end
end