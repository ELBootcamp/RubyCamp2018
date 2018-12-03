require 'byebug'

class LcdDigits
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

  def build_lcd_digits(number)
    (raise ArgumentError) unless number.is_a?(Numeric)
    
    transform_number_to_lcd(number)
  end

  private

  def transform_number_to_lcd(number)
    digits_array = number.digits.reverse
    lcd_string = ''
    3.times do |line|
        lcd_string += print_line(digits_array, line)
    end
    lcd_string.strip
  end

  def print_line(digits_array, line)
    digits_array.map do |digit|
      get_line_chars(line, digit)
      end.join(' ') + "\n"
  end

  def get_line_chars(line, digit) 
    case line
    when 0 then DIGITS[digit][0..2]
    when 1 then DIGITS[digit][3..5]
    else DIGITS[digit][6..8]
    end
  end
end