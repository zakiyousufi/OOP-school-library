require_relative 'Nameable'

class BaseDecorator < nameable
  def initialize(nameable)
    super()
    @nameable = nameable
  end
end
