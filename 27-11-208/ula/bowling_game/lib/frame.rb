class Frame
  def initialize
    @knocks = Array.new(2)
  end

  attr_accessor :knocks

  def first_knock
    @first_knock ||= knocks[0]
  end

  def second_knock
    @second_knock ||= knocks[1]
  end

  def add_first_knock(pins_number)
    pins_number > 10 && raise(ArgumentError)

    knocks[0] = pins_number
    self
  end

  def add_second_knock(pins_number)
    first_knock + pins_number > 10 && raise(ArgumentError)

    knocks[1] = pins_number
    self
  end

  def pins_sum
    knocks.map(&:to_i).reduce(0, :+)
  end

  def strike?
    first_knock == 10
  end

  def spare?
    first_knock.to_i + second_knock.to_i == 10
  end
end
