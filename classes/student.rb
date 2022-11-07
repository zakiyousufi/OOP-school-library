require './person'

class Student < Person
  attr_reader :classroom, :parent_permission

  def initialize(name, id, age, parent_permission, classroom = nil)
    super(name, id, age, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    @classroom.students.push(self) unless classroom.students.include?(self)
  end
end
