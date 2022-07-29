require_relative '../book'

RSpec.describe Book do
  before(:all) do
    @book = Book.new('To Kill a mockingbird', 'Harper Lee')
  end

  context 'When a new Book is created' do
    it 'should be an instance of the Book class' do
      expect(@book).to be_instance_of Book
    end

    it 'should have a title attribute' do
      expect(@book).to have_attributes(title: 'To Kill a mockingbird')
    end

    it 'should have an author attribute' do
      expect(@book).to have_attributes(author: 'Harper Lee')
    end

    it 'should have a rental attribute' do
      expect(@book).to have_attributes(rentals: [])
    end

    it 'should have an id attribute' do
      expect(@book.book_id).to be_instance_of Integer
    end

    it 'should have an add_rental method' do
      expect(@book).to respond_to(:add_rental)
    end
  end
end
