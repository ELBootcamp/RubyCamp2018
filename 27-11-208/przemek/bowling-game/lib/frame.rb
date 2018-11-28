require 'byebug'

class Frame
  attr_accessor :values

  def initialize
    @values = []
  end

  def add_pin_num(pin_num)
    values.push(pin_num)
  end

  def spare?
    # byebug
    values[0..1].reduce(:+) == 10 && !values[1].nil?
  end

  def strike?
    values.first == 10 && values[1].nil?
  end

  # Maybe self.bonus(frame, bonus_frame) ?
  def bonus(frame)
    bonus_score = 0
    if(frame.strike?)
      bonus_score += values.reduce(:+)
    elsif(frame.spare?)
      bonus_score += values.first
    end
    bonus_score
  end
end