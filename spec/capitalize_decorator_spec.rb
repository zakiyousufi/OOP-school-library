require_relative '../classes/capitalize_decorator'
require_relative '../classes/person'

describe CapitalizeDecorator do
  context 'With valid arguments' do
    it 'should capitalize name of a person' do
      new_person = Person.new(34, nil, 'nicHolas')
      cap_name = CapitalizeDecorator.new(new_person)
      expect(cap_name.correct_name).to eq 'Nicholas'
    end
  end
end
