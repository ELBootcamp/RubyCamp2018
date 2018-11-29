require 'byebug'
require_relative 'frames_manager'

class BowlingGame
  attr_accessor :frames_manager
  
  def initialize
    @frames_manager = FramesManager.new
  end

  def roll(pin_num)
    frames_manager.push_roll(pin_num)
  end

  def score
    frames_manager.frames.each.with_index.reduce(0) do |sum, (frame, index)|
      frame_score = frame.result
      frame_score += frame.bonus(frames_manager.next_frame(index))
      sum += frame_score
    end
  end

  def frames_to_array
    frames_manager.frames.reduce([]) { |sum, frame| sum.push(frame.values) }
  end
end