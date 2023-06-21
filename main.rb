#!/usr/bin/env ruby
require_relative 'app'

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

def options(option, app)
  case option
  when 1
    add_book(app)
  when 2
    list_books(app)
  when 3
    add_person(app)
  when 4
    list_people(app)
  when 5
    add_rental(app)
  when 6
    list_rentals(app)
  when 7
    exit
  else
    puts 'Invalid selection'
  end
end

# Define separate methods for each option

def add_book(app)
  app.create_book
end

def list_books(app)
  app.list_all_books
end

def add_person(app)
  app.create_person
end

def list_people(app)
  app.list_all_people
end

def add_rental(app)
  app.add_rental
end

def list_rentals(app)
  app.list_all_rentals
end

def main
  app = App.new
  puts "Welcome to the School Library App!\n\n"

  loop do
    puts list_options
    option = gets.chomp.to_i
    options(option, app)
  end
end

main
