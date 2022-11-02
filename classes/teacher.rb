require_relative 'Person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(age, specialization = 'Java', name: 'unknown')
    super(age, name)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
