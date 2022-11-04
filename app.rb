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
end
  