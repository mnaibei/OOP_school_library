require_relative '../teacher'
require_relative '../person'

RSpec.describe Teacher do
  describe '#initialize' do
    context 'when initialized with valid parameters' do
      it 'creates a Teacher instance' do
        teacher = Teacher.new(17, true, 'John Doe')
        expect(teacher).to be_a(Teacher)
      end
    end
  end

  describe '#can_use_services?' do
    context 'when teacher is of age' do
      it 'returns true' do
        teacher = Teacher.new(18, true, 'John Doe')
        expect(teacher.can_use_services?).to eq(true)
      end
    end
  end

  #   describe '#correct_name' do
  #       context 'when teacher name is correct' do
  #       it 'returns true' do
  #           teacher = Teacher.new(17, true, 'John Doe')
  #           expect(teacher.correct_name).to eq('John Doe')
  #       end
  #       end
  #   end

  #   describe '#add_rental' do
  #       it 'creates a new rental' do
  #       teacher = Teacher.new(20, true)
  #       book = double('Book')
  #       date = double('Date')
  #       rental = double('Rental')
  #       allow(Rental).to receive(:new).and_return(rental)

  #       expect(teacher.add_rental(book, date)).to eq(rental)
  #       end
  #   end
end
