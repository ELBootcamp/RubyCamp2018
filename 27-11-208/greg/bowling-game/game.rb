class Game

  def initialize
    @frames = [[]]
  end

  attr_accessor :frames

  def roll(pins)
    frames << [] if frames.last.size >= 2
    frames.last << pins
  end

end