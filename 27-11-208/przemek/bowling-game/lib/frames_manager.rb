require_relative 'frame'

class FramesManager
  attr_accessor :frames, :current_frame

  def initialize
    @frames = [Frame.new]
    @current_frame = 0
  end

  def push_roll(pin_num)
    add_new_frame if create_frame?
    frames[current_frame].add_pin_num(pin_num)
    (raise ArgumentError) if current_frame >= 9 && frames[current_frame].pin_num > 3
  end

  def next_frame(index)
    frames[index + 1]
  end

  private

  def add_new_frame
    frames.push(Frame.new)
    self.current_frame += 1
  end

  def create_frame?
    (frames.last.pin_num >= 2 || frames.last.strike?) && frames.size < 10
  end
end