class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    # @title and @author instance variables
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(date, person)
    Rental.new(date, self, person)
  end

  def to_json(*_args)
    {
      'title' => @title,
      'author' => @author
    }.to_json
  end

  def self.from_json(json)
    data = JSON.parse(json)
    Book.new(data['title'], data['author'])
  end
end
