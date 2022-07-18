require "./Person.rb"

class Student < Person
    def initialize(name="unknown", age, parent_permision, classroom)
        super(name, age, parent_permision)
        @classroom = classroom
    end

    def play_hooky
        "¯\(ツ)/¯"
    end
end
