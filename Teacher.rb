require "./Person.rb"

class Teacher < Person
    def initialize(name="unknown", age, parent_permision=true, specialization)
        super(name, age, parent_permision)
        @specialization = specialization
    end

    def can_use_services?
        true
    end
end