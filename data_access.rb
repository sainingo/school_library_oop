require_relative './teacher'
require 'json'

def read_people
  file = File.read('people.json') if File.exist?('people.json')
  people = JSON.parse(file) unless file.chomp.empty?
  people.map do |person|
    if person['class_instance'] == 'Student'
      student = Student.new(person['age'], person['classroom'], person['name'], person['parent_permission'])
      student.id = person['id']
      $application.people.push(student)
    else
      teacher = Teacher.new(person['age'], person['specialization'], person['name'])
      teacher.id = person['id']
      $application.people.push(teacher)
    end
  end || []
end

def read_books
  file = File.read('books.json') if File.exist?('books.json')
  books = JSON.parse(file) unless file.chomp.empty?
  $application.books = books.map { |book| Book.new(book['title'], book['author']) } || []
end

def read_rentals
  file = File.read('rentals.json') if File.exist?('rentals.json')
  rentals = JSON.parse(file) unless file.chomp.empty?
  $application.rentals = rentals.map do |rental|
    Rental.new(rental['date'], rental['book_title'], rental['person_id'])
  end
end

def save_data
  save_person
  save_book
  save_rental
  puts 'Thank you for using our library'
end

def save_person
  peoples_array_data = $application.people.map do |person|
    if person.instance_of?(Teacher)
      { class_instance: 'Teacher', id: person.id, age: person.age, specialization: person.specialization,
        name: person.name }
    else
      { class_instance: 'Student', id: person.id, age: person.age, classroom: person.classroom,
        name: person.name, parent_permission: person.parent_permission }
    end
  end
  people = JSON.generate(peoples_array_data)
  File.write('people.json', people)
end

def save_book
  books_array = $application.books.map do |book|
    { class_instance: 'Book', title: book.title, author: book.author }
  end
  books = JSON.generate(books_array)
  File.write('books.json', books)
end

def save_rental
  rentals_array = $application.rentals.map do |rental|
    { class_instance: 'Rental', date: rental.date, book_title: rental.book_title, person_id: rental.person_id }
  end
  rentals = JSON.generate(rentals_array)
  File.write('rentals.json', rentals)
end
