class Frame 

  def initialize(round = 0)
    @round = round
    @values = []
    @is_strike = false
    @is_spare = false
  end
  attr_accessor :round, :values, :is_strike, :is_spare
 
  def check_ten
    if values.reduce(0, :+) >= 10
      values.length == 1 ? @is_strike = true : @is_spare = true
    end
  end
end


