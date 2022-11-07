require 'json'
require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'

class Preserve
  attr_accessor :books, :people, :rentals

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def save_book(book)
    if File.exist?('books.json')
      books_loaded = JSON.parse(File.read('books.json'))
      books_loaded << { id: book.id, title: book.title, author: book.author }
      File.write('books.json', JSON.pretty_generate(books_loaded))
    else
      File.write('books.json', JSON.pretty_generate([{ id: book.id, title: book.title, author: book.author }]))
    end
  end

  def load_books
    return unless File.exist?('books.json')

    books_loaded = JSON.parse(File.read('books.json'))
    books_loaded.each do |book|
      new_book = Book.new(book['id'], book['title'], book['author'])
      @books << new_book
    end
  end

  def save_person(person)
    new_person = nil
    if person.instance_of? Student
      new_person = { id: person.id, age: person.age, name: person.name, parent_permission: person.parent_permission,
                     type: 'student' }
    elsif person.instance_of? Teacher
      new_person = { id: person.id, age: person.age, name: person.name, specialization: person.specialization,
                     type: 'teacher' }
    end
    if File.exist?('people.json')
      people_loaded = JSON.parse(File.read('people.json'))
      people_loaded << new_person
      File.write('people.json', JSON.pretty_generate(people_loaded))
    else
      File.write('people.json', JSON.pretty_generate([new_person]))
    end
  end

  def load_people
    return unless File.exist?('people.json')

    people_loaded = JSON.parse(File.read('people.json'))
    people_loaded.each do |person|
      case person['type']
      when 'student'
        new_person = Student.new(nil, person['id'], person['age'], person['name'], person['parent_permission'])
        @people << new_person
      when 'teacher'
        new_person = Teacher.new(person['specialization'], person['id'], person['age'], person['name'])
        @people << new_person
      end
    end
  end

  def save_rental(rental)
    if File.exist?('rentals.json')
      rentals_loaded = JSON.parse(File.read('rentals.json'))
      rentals_loaded << { date: rental.date, person_id: rental.person.id, book_id: rental.book.id }
      File.write('rentals.json', JSON.pretty_generate(rentals_loaded))
    else
      File.write('rentals.json',
                 JSON.pretty_generate([{ date: rental.date, person_id: rental.person.id, book_id: rental.book.id }]))
    end
  end

  def load_rentals
    return unless File.exist?('rentals.json')

    rentals_loaded = JSON.parse(File.read('rentals.json'))
    rentals_loaded.each do |rental|
      book = @books.select { |x| x.id == rental['book_id'] }[0]
      person = @people.select { |x| x.id == rental['person_id'] }[0]
      new_rental = Rental.new(rental['date'], book, person)
      @rentals << new_rental
    end
  end
end
