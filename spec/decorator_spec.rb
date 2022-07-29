require_relative '../base_decorator'
require_relative '../capitalize_decorator'
require_relative '../trimmer_decorator'
require_relative '../person'

RSpec.describe BaseDecorator do
  before(:all) do
    @person = Person.new(23, 'heres is a really long name')
  end

  context 'When testing decorator classes' do
    it 'Should return a capitalized string' do
      cap_person = CapitalizeDecorator.new(@person)
      expect(cap_person.correct_name).to eq 'HERES IS A REALLY LONG NAME'
    end

    it 'Should trim a string to 10 characters' do
      trim_person = TrimmerDecorator.new(@person)
      expect(trim_person.correct_name).to eq 'heres is a'
    end
  end
end
