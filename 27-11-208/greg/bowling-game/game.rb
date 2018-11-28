class Game

  def initialize
    @frames = [[]]
  end

  attr_accessor :frames

  def roll(pins)
    frames << [] if frames.last.size >= 2 || frames.last.include?(10)
    (frames.last.reduce(0, :+) + pins) > 10 && raise(ArgumentError)
    frames.last << pins
  end

  def score
    frames.map do |frame|
      frame.reduce(&:+) == 10 ? frame.last + frame.reduce(&:+) : frame.reduce(&:+)
    end.reduce(&:+)
  end

end