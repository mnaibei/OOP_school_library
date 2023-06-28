require_relative '../person'
require_relative '../rental'

RSpec.describe Person do
  describe '#initialize' do
    context 'when initialized with valid parameters' do
      it 'creates a Person instance' do
        person = Person.new(17, true, 'John Doe')
        expect(person).to be_a(Person)
      end
    end
  end

  describe '#can_use_services?' do
    context 'when person is of age' do
      it 'returns true' do
        person = Person.new(18, true, 'John Doe')
        expect(person.can_use_services?).to eq(true)
      end
    end

    context 'when person is not of age' do
      it 'returns false' do
        person = Person.new(17, true, 'John Doe')
        expect(person.can_use_services?).to eq(false)
      end
    end
  end

  describe '#correct_name' do
    context 'when person name is correct' do
      it 'returns true' do
        person = Person.new(17, true, 'John Doe')
        expect(person.correct_name).to eq('John Doe')
      end
    end
  end

  describe '#add_rental' do
    it 'creates a new rental' do
      person = Person.new(20, true)
      book = double('Book')
      date = double('Date')
      rental = double('Rental')
      allow(Rental).to receive(:new).and_return(rental)

      expect(person.add_rental(book, date)).to eq(rental)
    end
  end
end
