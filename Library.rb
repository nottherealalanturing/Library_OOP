class Person
    attr_reader :@name
    attr_reader :@age
    attr_reader :@parent_permision
    attr_writer :rentals

    def initialize(name, age, parent_permision, rentals)
        @name = name
        @age = age
        @rentals = rentals
        @parent_permision = parent_permision
    end

    def can_use_services?
        if @parent_permision == true
            return true 
        else
            false
        end
    end

    def validate_names
        return true
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