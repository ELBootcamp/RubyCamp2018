require 'byebug'

class Game

  def initialize
    @frames = [[]]
  end

  attr_accessor :frames

  def roll(pins)
    frames.size <= 9 ? handle_rolls(pins) : frames.last << pins
  end

  def score
    scores = frames.map.with_index do |frame, index|
      frame_sum = frame.reduce(:+)
      score_frame(frame, frame_sum, index)
    end.reduce(:+)
  end

  private 

  def handle_rolls(pins)
    frames << [] if frames.last.size >= 2 || frames.last.include?(10)
    (frames.last.reduce(0, :+) + pins) > 10 && raise(ArgumentError)
    frames.last << pins
  end

  def score_frame(frame, frame_sum, index)
    case
    when hit_spare?(frame) then frame_sum + frames[index+1].first
    when hit_strike?(frame) then handle_strike_score(frame.first, frames[index+1], index)
    else frame_sum
    end
  end

  def hit_spare?(frame)
    frame.size == 2 && frame.reduce(:+) == 10
  end

  def hit_strike?(frame)
    frame.size == 1
  end

  def handle_strike_score(frame, next_frame, index)
    return frame if next_frame.nil?
    if hit_strike?(next_frame)
      frame + next_frame.first + frames[index + 2].first
    else
      frame + next_frame[0..1].reduce(:+)
    end
  end
end
