require_relative 'frame'
require 'byebug'

class Game
  def initialize
    @round = 0
    @counter = 0
    @first = true
    @frames = {}
    @scoring = 0
  end

  attr_accessor :round, :counter, :scoring, :frames, :first

  def roll(pins)
    return 'No more rolls allowed' if @round == 10 && @frames[@round].values.length == 3
    return @frames[@round] if tenth_round_additional_rolls(pins)

    if @first && pins != 10
      @counter = pins
      @first = false
    else
      @round += 1 if @round != 10
      frame = Frame.new     
      frame.values = pins == 10 ? [pins] : [@counter, pins]
      frame.check_ten
      @frames[@round] = frame 
      @first = true if @round != 10
      @frames[@round]
      
    end
  end

  def tenth_round_additional_rolls(pins)
    if !@frames[10].nil?     
      @frames[10].values.push(pins)
      @frames[10].check_ten
      true
    else 
      false
    end
  end

  def scoring
    round.zero? && (return @scoring)
    @frames.each do |key, value|
      if key != round
        value.frame_sum += frames[key + 1].values[0] if value.is_spare
        value.frame_sum += frames[key + 1].frame_sum_next if value.is_strike
      end
      @scoring += value.frame_sum
    end
    @scoring
  end
end


