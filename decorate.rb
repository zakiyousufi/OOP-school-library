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
  def correct_name
    @nameable.correct_name.capitalize
  end
end

class TrimmerDecorator < BaseDecorator
  
end
