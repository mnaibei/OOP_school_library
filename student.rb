require_relative './person'

class Student < Person
  attr_reader :classroom

  def initialize(age, classroom, name = 'unknown', parent_permission: true)
    super(name, age, parent_permission)
    @classroom = classroom # Set the classroom attribute for the student
    classroom.students << self # Add the student to the students array of the corresponding classroom
  end

  #   Create the belongs-to side (a student belongs to a classroom).
  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.includes?(self)
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
