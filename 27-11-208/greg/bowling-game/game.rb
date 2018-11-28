require 'byebug'

class Game

  def initialize
    @frames = [[]]
  end

  attr_accessor :frames

  def roll(pins)
    frames.size <= 9 ? handle_rolls(frames, pins) : frames.last << pins
  end

  def score
    scores = frames.map.with_index do |frame, index|
      frame_sum = frame.reduce(:+)
      score_frame(frame, frame_sum, index)
    end
    scores.reduce(:+)
  end

  private 

  def handle_rolls(frames, pins)
    frames << [] if frames.last.size >= 2 || frames.last.include?(10)
    (frames.last.reduce(0, :+) + pins) > 10 && raise(ArgumentError)
    frames.last << pins
  end

  def score_frame(frame, frame_sum, index)
    if hit_spare?(frame)
      frame_sum + frames[index+1].first
    elsif hit_strike?(frame)
      handle_strike_score(frame, frames[index+1], index)
    else
      frame_sum
    end
  end

  def hit_spare?(frame)
    frame.size == 2 && frame.reduce(:+) == 10
  end

  def hit_strike?(frame)
    frame.size == 1
  end

  def handle_strike_score(frame, next_frame, index)
    return frame.first if next_frame.nil?
    if hit_strike?(next_frame)
      frame.first + next_frame.reduce(0, :+) + frames[index + 2].first
    else
      frame.first + next_frame[0..1].reduce(0, :+)
    end
  end

end