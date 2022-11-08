require_relative '../classroom'
require_relative '../student'

describe Student do
  context 'With valid arguments' do
    it 'should return name of the person' do
      new_student = Student.new(nil, nil, 21, 'Said', true)
      expect(new_student.correct_name).to eq 'Said'
    end

    it 'should check whether the student can use services' do
      new_student = Student.new(nil, nil, 12, 'Piesie', false)
      expect(new_student.can_use_services?).to eq false
    end

    it 'should put student in a specific classroom' do
      new_student = Student.new(nil, nil, 21, 'Said', true)
      new_classroom = Classroom.new('CS Class')
      new_student.classroom = new_classroom
      expect(new_student.classroom).to eq new_classroom
    end
  end
end
