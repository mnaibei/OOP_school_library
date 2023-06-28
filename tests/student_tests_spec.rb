require_relative '../student'
require_relative '../classroom'

RSpec.describe Student do
  describe '#initialize' do
    context 'when initialized with valid parameters' do
      it 'creates a Student instance' do
        student = Student.new('Classroom', 17, true, 'John Doe')
        expect(student).to be_a(Student)
      end
    end
  end

  describe '#play_hooky' do
    it 'returns a string' do
      student = Student.new('Classroom', 17, true, 'John Doe')
      expect(student.play_hooky).to be_a(String)
    end
  end

  describe '#classroom=' do
    it 'sets the classroom attribute' do
      students = Classroom.new('Classroom')
      students.label = 'New Classroom'
      expect(students.label).to eq('New Classroom')
    end
  end
end
