require_relative '../student'
require_relative '../book'
require_relative '../rental'

RSpec.describe Rental do
  before(:all) do
    student1 = Student.new(20, 'false', 'Man')
    book1 = Book.new('The Great Gatsby', 'F. Scott Fitzgerald')
    date = '2022-07-29'
    @rental1 = Rental.new(date, book1, student1)
  end
  context 'when a new rental is created' do
    it 'should be an instance of rental' do
      expect(@rental1).to be_instance_of Rental
    end

    it 'should have a book attribute which is an instance of book' do
      expect(@rental1.book).to be_instance_of Book
    end

    it 'should have a teacher/ student attribute which is a subclass of person' do
      expect(@rental1.person).to be_kind_of Person
    end
  end
end
