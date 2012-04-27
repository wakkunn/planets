class Ball
  attr_accessor :change, :level
  
  def initialize(hash)
    @change = hash[:change]
    @level = hash[:level]
  end
end
