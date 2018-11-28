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
    
    scores = frames.map.with_index do |frame, index|
      if hit_spare?(frame)
        frame.reduce(&:+) + frames[index+1].first
      elsif hit_strike?(frame)
        handle_strike_score(frame, frames[index+1])
      else
        frame.reduce(&:+)
      end
    end
    
    scores.reduce(&:+)
    
  end

  private 
  
  def hit_spare?(frame)
    frame.size == 2 && frame.reduce(&:+) == 10
  end

  def hit_strike?(frame)
    frame.size == 1
  end

  def handle_strike_score(frame, next_frame)
    return 10 if next_frame.nil?
    frame.reduce(&:+) + next_frame.reduce(0, :+)
  end

end