require_relative 'create'

def main
  create = Create.new
  puts 'Welcome to School Library App!'

  loop do
    puts "\nPlease choose an option by enetering a number:\n1 - List all books"
    puts "2 - List all people\n3 - Create a person"
    puts "4 - Create a book\n5 - Create a rental\n6 - List all rentals for a given person id\n7 - Exit"

    choice = gets.chomp.to_i
    if choice == 7
      puts 'Thanks for using this app!'
      break
    end

    create.call_app(choice)
  end
end

main
