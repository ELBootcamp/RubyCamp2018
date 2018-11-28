require 'byebug'

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
    
    frames.map.with_index do |frame, index|
      if hit_spare?(frame)
        frame.last + frame.reduce(&:+)
      elsif hit_strike?(frame)
        frame.reduce(&:+) + frames[index+1].reduce(&:+)
      else
        frame.reduce(&:+)
      end
    end.reduce(&:+)
    
  end

  private 
  
  def hit_spare?(frame)
    frame.size == 2 && frame.reduce(&:+) == 10
  end

  def hit_strike?(frame)
    frame.size == 1 && frame.reduce(&:+) == 10
  end

end