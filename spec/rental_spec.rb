require_relative '../rental'

describe Rental do
  context 'When providing a book title and a person id' do
    rented = Rental.new('01-02-2022', 'BookTitle', 2)

    it 'Should create rental for person' do
      expect(rented).to be_an_instance_of Rental
    end
  end
end
