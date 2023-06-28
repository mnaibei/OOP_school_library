require_relative '../book'
require_relative '../rental'

RSpec.describe Book do
  describe '#initialize' do
    context 'when initialized with valid parameters' do
      it 'creates a Book instance' do
        book = Book.new('Eloquent JavaScript', 'Marijn Haverbeke')
        expect(book).to be_a(Book)
      end
    end
  end

  describe '#add_rental' do
    it 'creates a new rental' do
      book = Book.new('Eloquent JavaScript', 'Marijn Haverbeke')
      person = double('Person')
      date = double('Date')
      rental = double('Rental')
      allow(Rental).to receive(:new).and_return(rental)

      expect(book.add_rental(date, person)).to eq(rental)
    end
  end
end
