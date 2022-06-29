require_relative '../person'

describe 'Person' do
  before :each do
    @person = Person.new(20, 'Susan', true)
  end

  describe '#new' do
    it 'return the person object' do
      expect(@person).to be_an_instance_of Person
    end

    it 'has a set name Susan' do
      expect(@person.name).to eql 'Susan'
    end

    it 'should have parents permission' do
      expect(@person.parent_permission).to be true
    end

    it 'should not have parents permission' do
      nperson = Person.new(15, 'Susan', false)
      expect(nperson.parent_permission).to be_falsey
    end
  end

  describe 'Can use services' do
    context 'use method to validate age' do
      it 'is of age' do
        person = Person.new(18)
        expect(person.of_age?).to be true
      end
    end
  end
end
