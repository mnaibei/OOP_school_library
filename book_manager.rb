require_relative 'book'
require_relative 'app'

class BookManager
  attr_reader :books

  def initialize
    @books = []
  end

  def create_book
    puts ''
    print 'Enter book title: '
    title = App.new.user_input
    print 'Enter book author: '
    author = App.new.user_input
    @books << Book.new(title, author)
    puts 'Success'
  end

  def list_all_books
    puts ''
    @books.each { |book| puts "Title: #{book.title}", "Author: #{book.author}" }
  end
end
