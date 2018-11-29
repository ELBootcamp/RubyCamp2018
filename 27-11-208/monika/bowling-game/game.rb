require_relative 'frame'
require 'byebug'

class Game
  def initialize
    @round = 0
    @frames = {}
    @scoring = 0
  end

  attr_accessor :round, :scoring, :frames

  def roll(pins)
    return 'No more rolls allowed' if round == 10 && game_over
    return frames[round] if tenth_round_add_rolls(pins)
    return @first_element = pins if @first_element.nil? && pins != 10
      
    create_new_frame(pins)
  end

  def create_new_frame(pins)
    @round += 1 if round != 10
    frame = Frame.new
    frame.values = pins == 10 ? [pins] : [@first_element, pins]
    frame.set_frame_values
    frames[@round] = frame
    @first_element = nil if round != 10
    frame
  end

  def game_over
    frames[round].values.length == 3
  end

  def tenth_round_add_rolls(pins)
    return false if frames[10].nil?
    
    frames[10].values.push(pins)
    frames[10].set_frame_values
    true
  end

  def scoring
    round.zero? && (return @scoring)

    frames.each do |key, value|
      if key != round
        value.frame_sum += get_bonus_for_spare(key + 1) if value.is_spare
        value.frame_sum += get_bonus_for_strike(key + 1) if value.is_strike
      end
      @scoring += value.frame_sum
    end
    @scoring
  end

  def get_bonus_for_strike(round_number)
    if rolls(round_number).length == 1 && frames[round_number]
      rolls(round_number)[0] + rolls(round_number + 1)[0]
    else
      frames[round_number].frame_sum_strike
    end
  end

  def get_bonus_for_spare(round_number)
    rolls(round_number)[0]
  end

  def rolls(round_number)
    frames[round_number].values
  end
end



