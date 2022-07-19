class Person
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age, parent_permision = 'true', name = 'unknown')
    @id = Random.rand(1..500)
    @name = name
    @age = age
    @parent_permision = parent_permision
  end

  def can_use_services?
    return true if @parent_permision == 'true' || is_of_age

    false
  end

  private

  def of_age?
    return true if @age > 18
  end
end
