require_relative './nameable'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id, :rental, :parent_permission

  def initialize(age, name = 'Unknown', parent_permission = true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rental = []
  end

  def of_age?
    @age >= 18
  end

  def can_use_services?
    of_age? || @parent_permission == true
  end

  def correct_name
    @name
  end

  def add_rental(book, date)
    Rental.new(date, book, self)
  end
end

# person = Person.new(15, 'maximilianus', false)
# puts person.correct_name
# puts person.can_use_services?
