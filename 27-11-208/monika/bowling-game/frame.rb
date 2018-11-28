class Frame 

  def initialize(round = 0)
    @round = round
    @values = []
    @is_strike = false
    @is_spare = false
    @frame_sum = 0
  end
  attr_accessor :round, :values, :is_strike, :is_spare, :frame_sum
 
  def check_ten
    if values.reduce(0, :+) >= 10
      values.length == 1 ? @is_strike = true : @is_spare = true
    end
    @frame_sum = values.reduce(0, :+)
  end
end


