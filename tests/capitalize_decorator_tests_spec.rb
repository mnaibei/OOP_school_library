require_relative '../capitalize_decorator'

RSpec.describe CapitalizeDecorator do
  describe '#correct_name' do
    it 'capitalizes the name using the base decorator' do
      base_decorator = double('BaseDecorator')
      allow(base_decorator).to receive(:correct_name).and_return('john doe')

      decorator = CapitalizeDecorator.new(base_decorator)
      result = decorator.correct_name

      expect(result).to eq('John doe')
    end
  end
end

# RSpec.describe CapitalizeDecorator do
#     describe '#correct_name' do
#       it 'returns the correct name' do
#         decorator = CapitalizeDecorator.new('john')
#         expect(decorator.correct_name).to eq('John')
#       end
#     end
#   end
