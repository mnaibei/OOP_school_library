# require_relative 'person'
# require_relative 'book'
# require_relative 'student'
# require_relative 'teacher'
# require_relative 'rental'

# class App
#   attr_accessor :person, :books, :rentals

#   def initialize()
#     @person = []
#     @books = []
#     @rentals = []
#   end

#   def create_book
#     puts ''
#     print 'Enter book title: '
#     title = gets.chomp
#     print 'Enter book author: '
#     author = gets.chomp
#     @books << Book.new(title, author)
#     puts 'Success'
#   end

#   def list_all_books
#     puts ''
#     @books.each { |book| puts "Title: #{book.title}", "Author: #{book.author}" }
#   end

#   def create_person
#     puts ''
#     print 'Enter 1 to add Student and 2 to add Teacher: '
#     selection = gets.chomp.to_i
#     print 'Enter name: '
#     name = gets.chomp
#     print 'Enter age: '
#     age = gets.chomp.to_i

#     case selection
#     when 1
#       print 'Does student have parent permission [Y/N]: '
#       permission = gets.chomp.downcase == 'y'
#       student = Student.new(1, age, permission, name)
#       @person << student

#     when 2
#       print 'What is the teachers specialization: '
#       specialization = gets.chomp
#       teacher = Teacher.new(age, specialization, name)
#       @person << teacher
#     end

#     print 'Success'
#   end

#   def list_all_people
#     puts ''
#     @person.each do |person|
#       puts ''
#       puts "[#{person.class}]"
#       puts "Name: #{person.name}"
#       puts "Age: #{person.age}"

#       if person.instance_of?(Teacher)
#         puts "Specialization: [#{person.specialization}]"
#       else
#         puts "Permission: #{person.parent_permission}"
#       end
#     end
#   end

#   def add_rental
#     puts ''
#     puts 'Select a book from below by number: '

#     @books.each_with_index { |book, index| puts "(#{index}) Title: #{book.title}, Author: #{book.author}" }
#     puts ''
#     book_num = gets.chomp.to_i
#     puts ''

#     puts 'Select a person from below by number : '
#     @person.each_with_index do |person, index|
#       puts "(#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
#     end
#     puts ''
#     person_num = gets.chomp.to_i
#     puts ''

#     print 'Date(yyyy/mm/dd): '
#     date = gets.chomp

#     rental = Rental.new(date, @books[book_num], @person[person_num])
#     @rentals << rental
#     puts ''
#     puts 'Success'
#   end

#   def list_all_rentals
#     puts ''
#     puts 'All ID\'s:'
#     @rentals.each do |rental|
#       puts rental.person.id if rental.person.id
#     end
#     puts ''

#     print 'Please select an ID to show more details: '
#     id = gets.chomp.to_i
#     puts ''

#     puts 'Rental(s) for this ID: '
#     @rentals.each do |rental|
#       if rental.person.id == id
#         puts "Date: #{rental.date} Book: #{rental.book.title} by #{rental.book.author}"
#       else
#         puts 'Person does not exist'
#       end
#     end
#   end
# end


require_relative 'book_manager'
require_relative 'person_manager'
require_relative 'rental_manager'

class App
  def initialize
    @book_manager = BookManager.new
    @person_manager = PersonManager.new
    @rental_manager = RentalManager.new(@book_manager.books, @person_manager.people)
  end

  def list_options
    '
      1 - Add a book
      2 - Show all books
      3 - Add a person
      4 - Show all people
      5 - Add a rental
      6 - Show all rentals for a given ID
      7 - Exit
    '
  end

  def options(option)
    case option
    when 1
      @book_manager.create_book
    when 2
      @book_manager.list_all_books
    when 3
      @person_manager.create_person
    when 4
      @person_manager.list_all_people
    when 5
      @rental_manager.add_rental
    when 6
      @rental_manager.list_all_rentals
    when 7
      exit
    else
      puts 'Invalid selection'
    end
  end

  def run
    puts "Welcome to the School Library App!\n\n"

    loop do
      puts list_options
      option = gets.chomp.to_i
      options(option)
    end
  end
end
