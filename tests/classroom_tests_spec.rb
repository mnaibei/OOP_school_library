require_relative '../classroom'

RSpec.describe Classroom do
  describe '#initialize' do
    context 'when initialized with valid parameters' do
      it 'creates a Classroom instance' do
        classroom = Classroom.new('Classroom')
        expect(classroom).to be_a(Classroom)
      end
    end
  end

  describe '#add_student' do
    it 'adds a student to the students array' do
      classroom = Classroom.new('Classroom')
      student = double('Student')
      allow(student).to receive(:classroom=)
      classroom.add_student(student)
      expect(classroom.students).to include(student)
    end
  end
end
