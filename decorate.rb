require_relative 'Nameable'

class BaseDecorator < nameable
  def initialize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
    @correct_name.correct_name
  end
end

class CapitalizeDecorator < BaseDecorator

end
