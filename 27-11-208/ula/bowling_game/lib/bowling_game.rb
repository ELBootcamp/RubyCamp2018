require_relative 'frame'
require_relative 'frames_stack'
require_relative 'tenth_frame'

class BowlingGame
  def initialize
    @frames = FramesStack.new
    @current_knock = 1
  end

  attr_accessor :frames, :current_knock

  def roll(pins_number)
    if current_frame_position == 10 && current_frame.should_allow_third_knock?
      current_frame.add_third_knock(pins_number)
    elsif current_knock.even?
      current_frame.add_second_knock(pins_number)
    else
      first_knock_in_the_next_frame(pins_number)
    end

    move_to_the_next_knock
  end

  def score
    frames.overall_score
  end

  private

  def first_knock_in_the_next_frame(pins_number)
    frame = initialize_new_frame
    frame.add_first_knock(pins_number)
    handle_strike_case(frame) if pins_number == 10
    frames.add_new_frame(frame)
  end

  def initialize_new_frame
    current_frame_position == 9 ? TenthFrame.new : Frame.new
  end

  def handle_strike_case(frame)
    move_to_the_next_knock
    frame.add_second_knock(0)
  end

  def move_to_the_next_knock
    self.current_knock += 1
  end

  def current_frame
    frames.current_frame
  end

  def current_frame_position
    frames.position_of(current_frame)
  end
end
