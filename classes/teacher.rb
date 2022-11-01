require_relative 'person'

class Teacher < person
  attr_accessor :specialization

  def initialize(age, specialization, name: 'unknown')
    super(age, name)
    @specialization = specialization
  end
  
end
