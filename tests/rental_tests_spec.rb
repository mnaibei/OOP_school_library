require 'json'
require_relative '../rental'

RSpec.describe Rental do
  let(:book) { Book.new('Title', 'Author') }
  let(:person) { Person.new(25, 'John Doe') }
  let(:date) { '24-05-2023' }
  let(:rental) { Rental.new(date, book, person) }

  describe '#initialize' do
    it 'sets the date, book, and person attributes' do
      expect(rental.date).to eq(date)
      expect(rental.book).to eq(book)
      expect(rental.person).to eq(person)
    end

    it 'adds itself to the rentals array of the book and person' do
      expect(book.rentals).to include(rental)
      expect(person.rentals).to include(rental)
    end
  end

  describe '#to_json' do
    it 'returns a JSON string' do
      expect(rental.to_json).to be_a(String)
    end
  end

  describe '.from_json' do
    it 'returns a Rental instance' do
      json = rental.to_json
      expect(Rental.from_json(json)).to be_a(Rental)
    end
  end
end
