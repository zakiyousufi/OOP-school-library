require_relative '../classes/trimmer_decorator'
require_relative '../classes/person'

describe TrimmerDecorator do
  context 'With valid arguments' do
    it 'should trim name of a person' do
      new_person = Person.new(34, nil, 'Abdelmejid Oumer Ali')
      cap_name = TrimmerDecorator.new(new_person)
      expect(cap_name.correct_name).to eq 'Abdelmejid'
    end
  end
end
