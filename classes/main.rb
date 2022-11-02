require_relative 'person'
require_relative 'decorator'

person = Person.new(10, 'lazycoders')
puts person.correct_name

capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name
