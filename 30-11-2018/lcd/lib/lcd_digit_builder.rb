require 'byebug'

class LcdDigitBuilder

  def build(digit)
    (raise ArgumentError) unless (0..9).cover?(digit)
  end
end