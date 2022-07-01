require_relative '../rental'

describe Rental do
  context 'When providing a book title and a person id' do
    it 'should be able to create a rental' do
      person = Person.new(20, 'John')
      book = Book.new('Harry Potter', 'JK Rowling')
      rental = Rental.new('2015/1/1', person, book)
      expect(rental.date).to eq('2015/1/1')
      expect(rental.person).to eq(person)
      expect(rental.book).to eq(book)
    end
  end
end
