require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'
require_relative 'preserve'

class App
  def initialize
    @preserve = Preserve.new
    @preserve.load_books
    @preserve.load_people
    @preserve.load_rentals
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    choice = gets.chomp.to_i

    case choice
    when 1
      create_student
    when 2
      create_teacher
    else
      puts 'Incorrect choice'
    end
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp

    book = Book.new(nil, title, author)
    @preserve.save_book(book)
    @preserve.books.push(book)
    puts 'Book created successfully'
  end

  def create_rental
    puts 'Select a book from the following list by number'
    list_books
    book_index = gets.chomp.to_i
    puts 'Select a person from the following list by number (not id)'
    list_people
    person_index = gets.chomp.to_i
    print 'Date: '
    date = gets.chomp

    rental = Rental.new(date, @preserve.books[book_index], @preserve.people[person_index])
    @preserve.save_rental(rental)
    @preserve.rentals.push(rental)
    puts 'Rental created successfully'
  end

  def list_books
    return puts 'No books found!' if @preserve.books.empty?

    @preserve.books.each_with_index { |book, i| puts "#{i}) Title: #{book.title}, Author: #{book.author}" }
  end

  def list_people
    return puts 'No people found!' if @preserve.people.empty?

    @preserve.people.each_with_index do |person, i|
      puts "#{i}) [#{person.class}] Name: #{person.name}, Age: #{person.age}, ID: #{person.id}"
    end
  end

  def list_rentals
    puts 'Enter ID of the person'
    list_people
    person_id = gets.chomp.to_i
    person = @preserve.people.select { |p| p.id == person_id }[0]
    person.rentals.each_with_index do |rental, i|
      puts "#{i}) Book title: #{rental.book.title}, Book author: #{rental.book.author}, Date: #{rental.date}"
    end
  end

  private

  def create_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    permission = gets.chomp.downcase == 'y'

    student = Student.new(nil, nil, age, name, permission)
    @preserve.save_person(student)
    @preserve.people.push(student)
    puts 'Person created successfully'
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp

    teacher = Teacher.new(specialization, nil, age, name)
    @preserve.save_person(teacher)
    @preserve.people.push(teacher)
    puts 'Person created successfully'
  end
end
