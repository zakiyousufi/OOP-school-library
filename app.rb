require './classes/person'
require './classes/book'
require './classes/rental'
require './classes/student'
require './classes/teacher'
require './classes/classroom'

class App
  attr_accessor :books_list, :people

  def initialize
    @books_list = []
    @people = []
    @rentals = []
    @students = []
    @teachers = []
  end
  
  def run
    display_list
  end
    
# ======= show list all the books =======
  def list_all_books
    if @books_list.empty?
      puts 'There are no books in the library'
    else
      @books_list.each_with_index { |book, i| puts "#{i}) Title: '#{book.title}', Author: #{book.author}" }
    end
  end
# ======= show list all the peoples =======
  def list_all_people
    if @people.empty?
      puts 'There are no people in the library'
    else
      @people.each_with_index do |person, i|
      puts "#{i}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
  end
        
# ======== Create person =======
  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]:'
    person_type = gets.chomp
    case person_type
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'Invalid option'
      create_person
    end
  end

  # ======== create student =======
  def create_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N] '
    parent_permission = gets.chomp
    parent_permission = true if parent_permission == 'y'
    parent_permission = false if parent_permission == 'n'
    student = Student.new(age, name, parent_permission)
    @people << student unless @people.include?(student)
    @students << student unless @students.include?(student)
    puts 'Student created successfully!'
  end
# ========= create teacher ==========
  def create_teacher
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(age, specialization, name)
    @people << teacher unless @people.include?(teacher)
    @teachers << teacher unless @teachers.include?(teacher)
    puts 'Teacher created successfully!'
  end
  # ========= create books ========
  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    puts "The book \'#{title}\' by #{author} was created successfully!"
    @books_list << book unless @books_list.include?(book)
  end

  # ======== create rentals ========
  def create_rental
    puts "Select a book from the following list by number:\n"
    list_all_books
    book_index = gets.chomp.to_i
    puts "Select a person from the following list by number:\n"
    list_all_people
    person_index = gets.chomp.to_i
    puts 'Enter a date: e.g 2022/09/28'
    date = gets.chomp
    rental = Rental.new(date, books_list[book_index], people[person_index])
    puts 'Rental successfully created!'
    @rentals << rental unless @rentals.include?(rental)
  end
# ========= check the name and date of rentals ========
  def list_all_rentals
    print 'ID of person:'
    person_id = gets.chomp.to_i
    rentals = @rentals.filter { |rental| rental.person.id == person_id }
    puts 'Rentals:'
    rentals.each { |rental| puts "Date: #{rental.date}, Book: '#{rental.book.title}' by #{rental.book.author}" }
  end

  # =========== show all the students ==========
  def list_all_students
    if @students.empty?
      puts 'There are no students in the library'
    else
      @students.each { |student| puts "Name: #{student.name}, ID: #{student.id}, Age: #{student.age}" }
    end
  end

end
  