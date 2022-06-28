require_relative './app'
require_relative './data_access'

def run
  puts ''
  puts 'Welcome to school libray app!'
  puts 'Please choose an option by entering a number:'
  puts '
    1 - List all books
    2 - List all people
    3 - Create a person
    4 - Create a book
    5 - Create a rental
    6 - list all rentals for a given person id
    7 - Exit
  '
  print 'Select an Option: '
  gets.chomp
end
$application = App.new
read_people
read_books
read_rentals

def main
  choice = run
  $application.get_option choice
end

main
