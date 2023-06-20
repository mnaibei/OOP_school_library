class Classroom
  attr_accessor :label, :students

  def initialize(label)
    @label = label
    @students = [] # Initialize an empty array to store the students associated with the classroom
  end

  def add_student(student)
    @students << student
    student.classroom = self
  end
end
