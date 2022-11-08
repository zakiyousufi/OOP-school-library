require_relative 'person'

class Student < Person
  def initialize(classroom, id, age, name, parent_permission)
    super(age, id, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  attr_reader :classroom, :parent_permission

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
