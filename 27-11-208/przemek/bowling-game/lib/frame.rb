class Frame
  attr_accessor :values

  def initialize
    @values = []
  end

  def add_pin_num(pin_num)
    values.push(pin_num)
  end
end