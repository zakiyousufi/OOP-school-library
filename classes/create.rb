require_relative 'app'

class Create
  def initialize
    @app = App.new
  end

  def call_app(choice)
    case choice
    when 1
      @app.list_books
    when 2
      @app.list_people
    when 3
      @app.create_person
    when 4
      @app.create_book
    when 5
      @app.create_rental
    when 6
      @app.list_rentals
    else
      puts 'Invalid input'
    end
  end
end
