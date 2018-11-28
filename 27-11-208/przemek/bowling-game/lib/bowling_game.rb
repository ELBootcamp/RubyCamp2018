require 'byebug'
require_relative 'frame'

class BowlingGame
  attr_accessor :frames
  
  def initialize
    @frames = [Frame.new]
  end

  def roll(*pins_num)
    pins_num.each do |pin|
      frames.push(Frame.new) if frames.last.values.size >= 2 || frames.last.strike?
      frames.last.add_pin_num(pin)
    end
  end

  def score
    frames.each.with_index.reduce(0) do |sum, (frame, index)|
      frame_score = frame.values.reduce(:+)
      frame_score += next_frame(index).bonus(frame) unless next_frame(index).nil?
      sum += frame_score
    end
  end

  def frames_to_array
    frames.reduce([]) { |sum, frame|  sum.push(frame.values) }
  end

  def next_frame(index)
    self.frames[index + 1]
  end
end