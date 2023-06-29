require_relative 'solver'

RSpec.describe Solver do
  it 'creates a Solver class' do
    solver = Solver.new
    expect(solver).to be_a(Solver)
  end

  describe '#factorial' do
    it 'returns the factorial of a number' do
      solver = Solver.new
      expect(solver.factorial(5)).to eq(120)
    end
  end

  describe '#reverse' do
    it 'returns the reverse of a string' do
      solver = Solver.new
      expect(solver.reverse('hello')).to eq('olleh')
    end
  end

  describe '#fizzbuzz' do
    it 'returns fizz if the number is divisible by 3' do
      solver = Solver.new
      expect(solver.fizzbuzz(3)).to eq('fizz')
    end

    it 'returns buzz if the number is divisible by 5' do
      solver = Solver.new
      expect(solver.fizzbuzz(5)).to eq('buzz')
    end

    it 'returns fizzbuzz if the number is divisible by 3 and 5' do
      solver = Solver.new
      expect(solver.fizzbuzz(15)).to eq('fizzbuzz')
    end

    it 'returns the number as a string if the number is not divisible by 3 or 5' do
      solver = Solver.new
      expect(solver.fizzbuzz(7)).to eq('7')
    end
  end
end
