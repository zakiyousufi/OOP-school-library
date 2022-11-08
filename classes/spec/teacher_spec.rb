require_relative '../teacher'

describe Teacher do
  context 'With valid arguments' do
    it 'should return specialization of the teacher' do
      new_teacher = Teacher.new('Java', nil, 27, 'Anas')
      expect(new_teacher.specialization).to eq 'Java'
    end

    it 'should update specialization of the teacher' do
      new_teacher = Teacher.new('Java', nil, 27, 'Anas')
      new_teacher.specialization = 'CPP'
      expect(new_teacher.specialization).to eq 'CPP'
    end
  end
end
