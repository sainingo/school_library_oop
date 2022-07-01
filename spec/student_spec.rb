require_relative '../student'
require_relative '../person'

describe Student do
  context 'When providing student information' do
    age = 15
    student1 = Student.new(age, nil, 'Kalolo', true)
    student2 = Student.new(10, nil, 'Tom', false)

    it 'Creates a new student with an age of 20 and a name of Kalolo' do
      expect(student1).to be_an_instance_of Student
    end

    it 'the student can have permission to use services' do
      expect(student1.can_use_services?).to eq false
    end

    it 'the student can have permission to use services' do
      expect(student2.can_use_services?).to eq false
    end
  end
end
