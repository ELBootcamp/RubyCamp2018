class Frame
  attr_accessor :values

  def initialize
    @values = []
  end

  def add_pin_num(pin_num)
    values.push(pin_num)
  end

  def spare?
    values[0..1].reduce(:+) == 10 && !values[1].nil?
  end

  def strike?
    values.first == 10 && values[1].nil?
  end

  def bonus(next_frame)
    return 0 if next_frame.nil?
    bonus_score = 0
    if strike?
      bonus_score += next_frame.values[0..1].reduce(:+)
      bonus_score += next_frame.values.first if !next_frame.nil? && next_frame.strike? 
    elsif spare?
      bonus_score += next_frame.values.first
    end
    bonus_score
  end

  def result
    values.reduce(0, :+)
  end

  def pin_num
    values.size
  end
end