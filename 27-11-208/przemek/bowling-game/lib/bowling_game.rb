class BowlingGame
  attr_accessor :frames
  
  def initialize
    @frames = [[]]
  end

  def roll(pins_num)
    frames.push([]) if frames.last.size >= 2
    frames.last.push(pins_num)
  end
end