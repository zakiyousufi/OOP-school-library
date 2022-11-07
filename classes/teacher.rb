require_relative 'person'

class Teacher < Person
  def initialize(specialization, id, age, name = 'Unknown', parent_permission: true)
    super(age, id, name, parent_permission: parent_permission)
    @specialization = specialization
  end

  attr_reader :parent_permission
  attr_accessor :specialization

  def can_use_services?
    true
  end
end
