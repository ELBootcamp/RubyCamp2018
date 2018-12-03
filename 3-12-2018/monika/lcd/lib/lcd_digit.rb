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
    3.times do |line|
      lcd_string += number_array.map do |number|
          if line == 0
            DIGITS[number][0..2]
          elsif line == 1
            DIGITS[number][3..5]
          else
            DIGITS[number][6..8]
          end
        end.join(' ') + "\n"
    end
    lcd_string.strip
  end
end

#LcdDigit.new.build("asd")