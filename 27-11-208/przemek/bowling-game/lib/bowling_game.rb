class BowlingGame
  attr_accessor :frames
  
  def initialize
    @frames = [[]]
  end

  def roll(pins_num)
    frames.last.push(pins_num)
  end
end