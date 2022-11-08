require_relative '../rental'
require_relative '../person'

describe Rental do
  context 'With valid arguments' do
    it 'should create an instance' do
      new_book = Book.new(nil, 'Cool Java', 'Sydney')
      new_person = Person.new(34, nil, 'Nicholas')
      new_rental = Rental.new('01/12/2022', new_book, new_person)
      expect(new_rental.date).to eq '01/12/2022'
    end

    it 'should update rentals of the book' do
      new_book = Book.new(nil, 'Cool Java', 'Sydney')
      new_person = Person.new(34, nil, 'Nicholas')
      Rental.new('01/12/2022', new_book, new_person)
      expect(new_book.rentals.length).to eq 1
    end

    it 'should update rentals of the person' do
      new_book = Book.new(nil, 'Cool Java', 'Sydney')
      new_person = Person.new(34, nil, 'Nicholas')
      Rental.new('01/12/2022', new_book, new_person)
      expect(new_person.rentals.length).to eq 1
    end
  end
end
