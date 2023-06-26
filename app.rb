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

  def user_input
    gets.chomp
  end

  def user_input_to_i
    gets.chomp.to_i
  end

  def user_permission
    gets.chomp.downcase == 'y'
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
