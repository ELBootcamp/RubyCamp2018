require 'byebug'

class LcdDigit
  DIGITS = { 
    0 => '._.|.||_|',
    1 => '.....|..|',
    2 => '._.._||_.',
    3 => '._.._|._|',
    4 => '...|_|..|',
    5 => '._.|_.._|',
    6 => '._.|_.|_|',
    7 => '._...|..|',
    8 => '._.|_||_|',
    9 => '._.|_|..|'
  }.freeze

  LINES = [0, 1, 2].freeze

  def build(number)
    (raise ArgumentError) unless (0..9999).cover?(number)
    
    number_array = number.digits.reverse
    LINES.map do |line|
      number_array.map do |number|
          string_line(DIGITS[number], line)
      end.join(' ')
    end.join("\n")
  end

  private 

  def string_line(string, line_num)
    case line_num
      when 0
        string[0..2]
      when 1
        string[3..5]
      else
        string[6..8]
    end
  end
end
