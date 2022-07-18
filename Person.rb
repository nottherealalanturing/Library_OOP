class Person
    attr_reader :id
    attr_accessor :name
    attr_accessor :age

    def initialize(name="unknown", age, parent_permision)
        @id = id
        @name = name
        @age = age
        @parent_permision = parent_permision
    end

    def can_use_services?
        if @parent_permision == true || self.is_of_age()
            return true 
        else
            false
        end
    end

    private
    def is_of_age
        if @age > 18
            return true
        else
            false
        end
    end

end