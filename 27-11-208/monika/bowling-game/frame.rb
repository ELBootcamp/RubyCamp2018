class Frame 

  def initialize
    @values = []
    @is_strike = false
    @is_spare = false
    @frame_sum = 0
  end
  attr_accessor :values, :is_strike, :is_spare, :frame_sum, :frame_sum_next
 
  def check_ten
    if values.reduce(0, :+) >= 10
      values.length == 1 ? @is_strike = true : @is_spare = true
    end
    @frame_sum_next = values[0..1].reduce(0, :+)
    @frame_sum = values.reduce(0, :+)
  end
end


