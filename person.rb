require './nameable'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age, :rentals, :person_id

  def initialize(age, name = 'unknown', parent_permision = 'true')
    @id = Random.rand(1..500)
    @name = name
    @age = age
    @parent_permision = parent_permision
    @rentals = []
    @person_id = nil;
    super()
  end

  def can_use_services?
    return true if @parent_permision == 'true' || is_of_age

    false
  end

  def correct_name
    name
  end

  def add_rental(date, book)
    Rental.new(date, book, self)
  end

  private

  def of_age?
    return true if @age > 18
  end
end
