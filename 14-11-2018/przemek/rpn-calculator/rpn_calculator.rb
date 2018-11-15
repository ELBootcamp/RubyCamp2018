class InvalidExpression < StandardError
end

class NotEnoughtOperands < StandardError
end

class RpnCalculator
  OPERAND = ['+', '-', '*', '/']

  def self.calculate(expression)
    stack = []
    raise InvalidExpression.new if expression.empty?

    expression.split(' ').each do |ex|
      raise InvalidExpression.new if OPERAND.include?(ex) || ex.to_i

      if !OPERAND.include?(ex)
        stack.push(ex.to_f)
      else
        val1 = stack.pop
        val2 = stack.pop
        
        raise NotEnoughtOperands.new if val1.nil? || val2.nil?

        stack.push(val2.method(ex).call(val1))
      end
    end
    stack.first
  end
end