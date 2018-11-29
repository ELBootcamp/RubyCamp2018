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

  def bonus(next_frame)
    bonus_score = 0
    if(self.strike?)
      bonus_score += next_frame.values[0..1].reduce(:+)
      bonus_score += 10 if !next_frame.nil? && next_frame.strike? 
    elsif(self.spare?)
      bonus_score += next_frame.values.first
    end
    bonus_score
  end

  def result
    values.reduce(0, :+)
  end
end