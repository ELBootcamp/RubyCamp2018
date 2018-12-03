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

  def build(number)
    (raise ArgumentError) unless number.is_a?(Integer)
    
    number_array = number.digits.reverse
    lcd_string = ''
    3.times { |line| lcd_string += draw_line(number_array, line) + "\n" }
    lcd_string.strip
  end

  def draw_line_for_digit(number, line)
    counter = line * 3
    DIGITS[number][counter..counter + 2]
  end

  def draw_line(number_array, line)
    number_array.map { |number| draw_line_for_digit(number, line) }.join(' ')
  end
end

