class NotEnoughOperands < StandardError
end

class InvalidExpression < StandardError
  # def initialize
  #   @message = "Not enough operands"
  # end
end

class RpnCalculator
  OPERANDS = ["+", "-", "*", "/"]  

  def self.calculate(expression)
    raise InvalidExpression if expression.empty?
    numbers_stack = []
    result = 0.0
    expression.split(' ').each do |element|
      if !OPERANDS.include?(element) 
        numbers_stack << element
      else 
        numbers_stack = compute_with(element, numbers_stack)
        result = numbers_stack[-1]
      end
    end
    result
  end

  def self.compute_with(element, numbers_stack)
    computation = numbers_stack[-2].to_f.method(element).call(numbers_stack[-1].to_f)
    numbers_stack = numbers_stack[0...-2]
    numbers_stack << computation
  end
  
end

p RpnCalculator.calculate("15 7 1 1 + - / 3 * 2 1 1 + + -")
p RpnCalculator.calculate("2 3 7 * -")