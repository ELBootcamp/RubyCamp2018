class BowlingGame
  attr_accessor :frames
  
  def initialize
    @frames = [[]]
  end

  def roll(*pins_num)
    pins_num.each do |pin|
      frames.push([]) if frames.last.size >= 2 || frames.last.include?(10)
      frames.last.push(pin)
    end
  end
end