require_relative 'nameable'

class Person < Nameable
  def initialize(age, parent_permission, name = 'unknown')
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end
  attr_reader :id, :parent_permission, :rentals
  attr_accessor :name, :age

  def can_use_services?
    return true if of_age?

    false
  end

  def correct_name
    @name
  end

  def add_rental(book, date)
    Rental.new(date, book, self)
  end

  def to_json(*_args)
    {
      'name' => @name,
      'age' => @age,
      'parent_permission' => @parent_permission
    }.to_json
  end

  def self.from_json(json)
    data = JSON.parse(json)
    Person.new(data['age'], data['parent_permission'], data['name'])
  end

  private

  def of_age?
    return true if @age >= 18

    false
  end
end
