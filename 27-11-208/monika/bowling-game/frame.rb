class Frame 
  def initialize
    @values = []
    @is_strike = false
    @is_spare = false
    @frame_sum = 0
  end
  attr_accessor :values, :is_strike, :is_spare, :frame_sum, :frame_sum_strike

  def set_frame_values
    if values.reduce(0, :+) >= 10
      values.length == 1 ? self.is_strike = true : self.is_spare = true
    end
    self.frame_sum_strike = values[0..1].reduce(0, :+)
    self.frame_sum = values.reduce(0, :+)
  end
end

