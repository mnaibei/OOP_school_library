require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'app'

class PersonManager
  attr_reader :people

  def initialize
    @people = []
  end

  def create_person
    puts ''
    print 'Enter 1 to add Student and 2 to add Teacher: '
    selection = App.new.user_input_to_i
    print 'Enter name: '
    name = App.new.user_input
    print 'Enter age: '
    age = App.new.user_input_to_i

    case selection
    when 1
      print 'Does student have parent permission [Y/N]: '
      permission = App.new.user_permission
      student = Student.new(1, age, permission, name)
      @people << student

    when 2
      print 'What is the teacher\'s specialization: '
      specialization = App.new.user_input
      teacher = Teacher.new(age, specialization, name)
      @people << teacher
    end

    print 'Success'
  end

  def list_all_people
    puts ''
    @people.each do |person|
      puts ''
      puts "[#{person.class}]"
      puts "Name: #{person.name}"
      puts "Age: #{person.age}"

      if person.instance_of?(Teacher)
        puts "Specialization: [#{person.specialization}]"
      else
        puts "Permission: #{person.parent_permission}"
      end
    end
  end
end
