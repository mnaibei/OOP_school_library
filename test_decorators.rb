require_relative 'person'
require_relative 'nameable'
require_relative 'base_decorator'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'

person = Person.new(22, 'maximilianus')
  puts person.correct_name
  puts capitalizedPerson = CapitalizeDecorator.new(person)
  puts capitalizedPerson.correct_name
  puts capitalizedTrimmedPerson = TrimmerDecorator.new(capitalizedPerson)
  puts capitalizedTrimmedPerson.correct_name