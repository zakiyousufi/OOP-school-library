require_relative '../classes/classroom'
require_relative '../classes/student'

describe Classroom do
  context 'With valid arguments' do
    it 'should create an instance' do
      new_classroom = Classroom.new('SE Class')
      expect(new_classroom.label).to eq 'SE Class'
    end

    it 'should change the label of classroom' do
      new_classroom = Classroom.new('SE Class')
      new_classroom.label = 'IT Class'
      expect(new_classroom.label).to eq 'IT Class'
    end

    it 'should add student' do
      new_classroom = Classroom.new('SE Class')
      new_student = Student.new(nil, nil, 21, 'Said', true)
      new_classroom.add_student(new_student)
      expect(new_classroom.students.length).to eq 1
    end
  end
end
