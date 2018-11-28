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
end