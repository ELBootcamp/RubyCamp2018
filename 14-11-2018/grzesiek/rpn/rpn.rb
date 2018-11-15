class RpnCalculator
  OPERANDS = ["+", "-", "*", "/"]

  def self.calculate(expression)
    stack = []
    expression.split(' ').each { |element|
      # puts "#{element}, #{OPERANDS.include?(element)}"
      stack << element if !OPERANDS.include?(element)
        
      
    }
    puts stack
  end

end

p RpnCalculator.calculate("15 7 1 1 + - / 3 * 2 1 1 + + -")
p RpnCalculator::OPERANDS