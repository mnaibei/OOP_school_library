require_relative './nameable'

class Person < Nameable
  # constructor
  def initialize(age, name = 'unknown', parent_permission: true)
    super()
    # instance variables
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end
  #  getters
  attr_reader :id
  attr_accessor :name, :age, :rentals

  def can_use_services?
    of_age? || parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(book, date)
    Rental.new(date, book, self)
  end

  #   private function

  private

  def of_age?
    age >= 18
  end
end
