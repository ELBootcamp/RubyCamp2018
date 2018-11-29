class TenthFrame < Frame
  def initialize
    @knocks = Array.new(3)
  end

  attr_accessor :knocks

  def third_knock
    knocks[2]
  end

  def add_third_knock(pins_number)
    pins_number > 10 && raise(ArgumentError)

    knocks[2] = pins_number
    self
  end

  def should_allow_third_knock?
    strike? || spare?
  end
end
