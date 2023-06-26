require_relative 'rental'
require_relative 'app'

class RentalManager
  attr_reader :rentals

  def initialize(books, people)
    @books = books
    @people = people
    @rentals = []
  end

  def add_rental
    puts ''
    puts 'Select a book from below by number: '

    @books.each_with_index { |book, index| puts "(#{index}) Title: #{book.title}, Author: #{book.author}" }
    puts ''
    book_num = App.new.user_input_to_i
    puts ''

    puts 'Select a person from below by number: '
    @people.each_with_index do |person, index|
      puts "(#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    puts ''
    person_num = App.new.user_input_to_i
    puts ''

    print 'Date(yyyy/mm/dd): '
    date = App.new.user_input

    rental = Rental.new(date, @books[book_num], @people[person_num])
    @rentals << rental
    puts ''
    puts 'Success'
  end

  def list_all_rentals
    puts ''
    puts 'All ID\'s:'
    @rentals.each do |rental|
      puts rental.person.id if rental.person.id
    end
    puts ''

    print 'Please select an ID to show more details: '
    id = App.new.user_input_to_i
    puts ''

    puts 'Rental(s) for this ID: '
    rentals_found = false
    @rentals.each do |rental|
      if rental.person.id == id
        puts "Date: #{rental.date} Book: #{rental.book.title} by #{rental.book.author}"
        rentals_found = true
      end
    end

    puts 'Person does not exist' unless rentals_found
  end
end
