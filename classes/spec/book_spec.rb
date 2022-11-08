require_relative '../book'
require_relative '../person'

describe Book do
  context 'With valid arguments' do
    it 'should create an instance' do
      new_book = Book.new(nil, 'Cool Java', 'Sydney')
      expect(new_book.title).to eq 'Cool Java'
    end

    it 'should change the value of author' do
      new_book = Book.new(nil, 'Javascript Adv', 'Amejid')
      new_book.author = 'Anas'
      expect(new_book.author).to eq 'Anas'
    end

    it 'should create a rental for the respective book' do
      new_book = Book.new(nil, 'Javascript Adv', 'Amejid')
      person = Person.new(23, nil, 'Sydney')
      new_book.rent_book(person, '09/12/2021')
      expect(new_book.rentals.length).to eq 1
    end
  end
end
