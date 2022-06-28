require './app'

def show_menu
  puts ''
  puts "Welcome to School Library App!\n\n"
  puts 'Please choose an option by entering a number:'
  puts '
    1 - List all books
    2 - List all people
    3 - Create a person
    4 - Create a book
    5 - Create a rental
    6 - List all rentals for a given person id
    7 - Exit
    '
  print 'Select an Option:'
  gets.chomp
end

def main
  app = App.new
  app.run
end

main
