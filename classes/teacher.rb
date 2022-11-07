require_relative 'person'

class Teacher < Person
  def initialize(age, id, name, specialization)
    super(age, id, name)
    @specialization = specialization
  end

  attr_reader :parent_permission
  attr_accessor :specialization

  def can_use_services?
    true
  end
end
