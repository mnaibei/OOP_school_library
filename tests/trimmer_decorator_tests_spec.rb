require_relative '../trimmer_decorator'

RSpec.describe TrimmerDecorator do
  describe '#correct_name' do
    it 'trims the name to a maximum length of 10 characters' do
      nameable = double('Nameable')
      allow(nameable).to receive(:correct_name).and_return('John Doe Long Name')

      decorator = TrimmerDecorator.new(nameable)
      result = decorator.correct_name

      expect(result).to eq('John Doe L')
    end
  end
end
