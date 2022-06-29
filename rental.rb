class Rental
  attr_accessor :date, :book_title, :person_id

  def initialize(date, book, person)
    @date = date
    @book_title = book
    @person_id = person
  end
end
