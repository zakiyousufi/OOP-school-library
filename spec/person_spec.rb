require_relative '../classes/book'
require_relative '../classes/person'

describe Person do
  context 'With valid arguments' do
    it 'should return name of the person' do
      new_person = Person.new(34, nil, 'Nicholas')
      expect(new_person.correct_name).to eq 'Nicholas'
    end

    it 'should check whether the person can use services' do
      new_person = Person.new(19, nil, 'Some guy')
      expect(new_person.can_use_services?).to eq true
    end

    it 'should create a rental for the respective book' do
      new_book = Book.new(nil, 'Javascript Adv', 'Amejid')
      person = Person.new(23, nil, 'Sydney')
      person.rent_book('09/12/2021', new_book)
      expect(person.rentals.length).to eq 1
    end
  end
end
