require 'byebug'
require_relative 'frame'

class BowlingGame
  attr_accessor :frames
  
  def initialize
    @frames = [Frame.new]
  end

  def roll(pin_num)
      frames.push(Frame.new) if create_frame?
      frames.last.add_pin_num(pin_num)

      (raise ArgumentError) if frames.size >= 10 && frames.last.values.size > 3
  end

  def score
    frames.each.with_index.reduce(0) do |sum, (frame, index)|
      frame_score = frame.result
      frame_score += frame.bonus(next_frame(index)) unless next_frame(index).nil?
      sum += frame_score
    end
  end

  def frames_to_array
    frames.reduce([]) { |sum, frame| sum.push(frame.values) }
  end

  def next_frame(index)
    self.frames[index + 1]
  end

  def create_frame?
    (frames.last.values.size >= 2 || frames.last.strike?) && frames.size < 10
  end
end