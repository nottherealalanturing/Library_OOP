require_relative "../person"

RSpec.describe Person do
    before(:all) do
        @person = Person.new(25)
    end
    context "when a new Person is created" do

        it "should be an instance of person" do
            expect(@person).to be_instance_of Person
        end
       
        it "should have an id" do
            expect(@person.id).to be_instance_of Integer
        end

        it "should have a name attribute" do
            expect(@person).to have_attributes(name: 'unknown')
        end 

        it "should have a age attribute" do
            expect(@person).to have_attributes(age: 25)
        end 

    end
end 

