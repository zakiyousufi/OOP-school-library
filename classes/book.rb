require_relative 'rental'
class Book
  attr_accessor :title, :author
  attr_reader :rentals, :id

  def initialize(id, title, author)
    @id = id || rand(1...1000)
    @title = title
    @author = author
    @rentals = []
  end

  def rent_book(person, date)
    Rental.new(date, self, person)
  end
end
