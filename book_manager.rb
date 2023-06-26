require_relative 'book'

class BookManager
  attr_reader :books

  def initialize
    @books = []
  end

  def create_book
    puts ''
    print 'Enter book title: '
    title = gets.chomp
    print 'Enter book author: '
    author = gets.chomp
    @books << Book.new(title, author)
    puts 'Success'
  end

  def list_all_books
    puts ''
    @books.each { |book| puts "Title: #{book.title}", "Author: #{book.author}" }
  end
end
