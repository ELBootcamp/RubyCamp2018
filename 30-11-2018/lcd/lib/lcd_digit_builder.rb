require 'byebug'

class LcdDigitBuilder
  def build(digit)
    (raise ArgumentError) unless (0..9).cover?(digit)
    "._.\n|_|\n..|"
  end
end