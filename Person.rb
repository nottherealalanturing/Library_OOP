class Person
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age, parent_permision, name = 'unknown')
    @id = id
    @name = name
    @age = age
    @parent_permision = parent_permision
  end

  def can_use_services?
    if @parent_permision == true || is_of_age
      true
    else
      false
    end
  end

  private

  def of_age?
    @age > 18
  end
end
