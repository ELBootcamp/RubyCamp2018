class FramesStack
  def initialize
    @frames = []
  end

  attr_accessor :frames

  def current_frame
    frames.last
  end

  def add_new_frame(frame)
    frames.size < 10 ? frames.push(frame) : raise(FramesCountExceeded)
  end

  def overall_score
    results_per_frame.inject(0, :+)
  end

  def position_of(frame)
    (frames.index(frame) && frames.index(frame) + 1) || nil
  end

  private

  def results_per_frame
    frames.map.with_index do |frame, index|
      frame.pins_sum + frame_bonus(frame, index)
    end
  end

  def frame_bonus(frame, index)
    (frame.strike? && strike_bonus(index)) || (frame.spare? && spare_bonus(index)) || 0
  end

  def strike_bonus(frame_index)
    return 0 unless (next_frame = next_frame(frame_index))

    next_frame.strike? ? strike_followed_by_strike(frame_index) : next_frame.pins_sum
  end

  def spare_bonus(frame_index)
    return 0 unless next_frame(frame_index)

    next_frame(frame_index).first_knock
  end

  def strike_followed_by_strike(frame_index)
    next_frame(frame_index).pins_sum + following_frame_pins(frame_index)
  end

  def following_frame_pins(frame_index)
    return 0 unless (following_frame = frames[frame_index + 2])

    following_frame.strike? ? following_frame.pins_sum : following_frame.first_knock
  end

  def next_frame(frame_index)
    frames[frame_index + 1]
  end
end

class FramesCountExceeded < StandardError; end
