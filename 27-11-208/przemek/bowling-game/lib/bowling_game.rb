require 'byebug'
require_relative 'frame'

class BowlingGame
  attr_accessor :frames
  
  def initialize
    @frames = [Frame.new]
  end

  def roll(*pins_num)
    pins_num.each do |pin|
      frames.push(Frame.new) if frames.last.values.size >= 2 || frames.last.values.include?(10)
      frames.last.add_pin_num(pin)
    end
  end

  def score
    frames_arr = self.frames_to_array
    frames_arr.each.with_index.reduce(0) do |sum, (frame, index)|
      frame_score = frame.reduce(:+)
      if(frame_score == 10 && frame.size == 1)
        frame_score += frames_arr[index + 1].reduce(:+) if frame_score == 10 && frames_arr[index + 1]
      else
        frame_score += frames_arr[index + 1].first if frame_score == 10 && frames_arr[index + 1]
      end
      sum += frame_score
    end
  end

  def frames_to_array
    frames.reduce([]) { |sum, frame|  sum.push(frame.values) }
  end
end