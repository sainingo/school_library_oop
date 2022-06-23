require './person'
class Student < Person
  attr_reader :classroom

  def initialize(age, classroom, name = 'unknown', parent_permision: true)
    super(age, name, parent_permision)
    @classroom = classroom
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.includes?(self)
  end

  def play_hooky
    '"¯\(ツ)/¯"'
  end
end
