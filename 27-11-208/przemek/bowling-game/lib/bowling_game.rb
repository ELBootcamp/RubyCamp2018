require 'byebug'

class BowlingGame
  attr_accessor :frames
  
  def initialize
    @frames = [[]]
  end

  def roll(*pins_num)
    pins_num.each do |pin|
      frames.push([]) if frames.last.size >= 2 || frames.last.include?(10)
      frames.last.push(pin)
    end
  end

  def score
    frames.each.with_index.reduce(0) do |sum, (frame, index)|
      frame_score = frame.reduce(:+)
      if(frame_score == 10 && frame.size == 1)
        frame_score += self.frames[index + 1].reduce(:+) if frame_score == 10 && self.frames[index + 1]
      else
        frame_score += self.frames[index + 1].first if frame_score == 10 && self.frames[index + 1]
      end
      sum += frame_score
    end
  end
end