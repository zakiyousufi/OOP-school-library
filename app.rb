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
end
  