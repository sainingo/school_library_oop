require './nameable'
class Decorator < Nameable
  def initialize(param = Nameable.new)
    super()
    @param = param
  end

  def correct_name
    @param.correct_name
  end
end
