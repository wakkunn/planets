class Catch  
  attr_accessor :value
  
  def initialize(value)
    @value = value
  end
  
  def to_i
    @value.to_i
  end
end