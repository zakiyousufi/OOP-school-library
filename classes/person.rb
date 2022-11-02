require_relative 'Nameable'

class Person < Nameable
  attr_accessor :name, :age, :parent_permission, :rentals, :id
  attr_reader :corrector

  def initialize(name, age, parent_permission = { parent_permission: true })
    super()
    @id = rand(1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @corrector = Corrector.new
  end

  def of_age?
    @age >= 18
  end

  def can_use_services?
    of_age && parent_permission[:parent_permission]
  end

  def validate_name
    @name = @corrector.correct_name
  end

  private :of_age?
end
