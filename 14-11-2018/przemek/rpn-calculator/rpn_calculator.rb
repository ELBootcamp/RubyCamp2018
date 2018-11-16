class InvalidExpression < StandardError
end

class NotEnoughtOperands < StandardError
end

class RpnCalculator
  OPERAND = ['+', '-', '*', '/']

  def self.calculate(expression)
    stack = []
    raise InvalidExpression if expression.empty?

    expression.split(' ').each do |ex|
      raise InvalidExpression unless RpnCalculator::OPERAND.include?(ex) || ex.numeric?

      if !OPERAND.include?(ex)
        stack.push(ex.to_f)
      else
        val1, val2 = stack.pop, stack.pop
        
        raise NotEnoughtOperands if val1.nil? || val2.nil?

        stack.push(val2.method(ex).call(val1))
      end
    end
    stack.first
  end
end

class String
  def numeric?
    Float(self) != nil rescue false
  end
end