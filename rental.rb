class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
    book.rentals << self
    person.rentals << self
  end

  def to_json(*_args)
    {
      'date' => @date,
      'book' => {
        'title' => @book.title,
        'author' => @book.author
      },
      'person' => {
        'age' => @person.age,
        'name' => @person.name
      }
    }.to_json
  end

  def self.from_json(json)
    data = JSON.parse(json)
    book = Book.new(data['book']['title'], data['book']['author'])
    person = Person.new(data['person']['age'], data['person']['name'])
    Rental.new(data['date'], book, person)
  end
end
