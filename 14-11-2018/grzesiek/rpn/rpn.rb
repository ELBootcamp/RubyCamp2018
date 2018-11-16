class NotEnoughOperands < StandardError
end

class InvalidExpression < StandardError
  def initialize
    @message = "Expression is invalid"
  end
end

class RpnCalculator
  OPERANDS = ["+", "-", "*", "/"]  

  def self.calculate(expression)
    (expression.empty? || expression.match(/[a-zA-Z]/)) && (raise InvalidExpression)
    numbers_stack = []
    counter = 0
    result = 0.0
    
    expression.split(' ').each do |element|
      counter += 1
      if !OPERANDS.include?(element) 
        numbers_stack << element
      else 
        numbers_stack = compute_with(element, numbers_stack)
        result = numbers_stack[-1]
      end
    end
    (counter.even?) && (raise NotEnoughOperands)
    result
  end

  def self.compute_with(element, numbers_stack)
    computation = numbers_stack[-2].to_f.method(element).call(numbers_stack[-1].to_f)
    numbers_stack = numbers_stack[0...-2]
    numbers_stack << computation
  end
  
end
