class InvalidExpression < StandardError
end

class NotEnoughtOperands < StandardError
end

class RpnCalculator

  def self.calculate(expression)
    stack = []
    raise InvalidExpression if expression.empty?

    expression.split(' ').each do |ex|
      raise InvalidExpression unless ex.operand? || ex.numeric?

      unless ex.operand?
        stack.push(ex.to_f)
      else
        values = stack.pop, stack.pop
        raise NotEnoughtOperands if values.any?(&:nil?)

        stack.push((values.last).execute(ex, values.first))
      end
    end
    stack.first
  end
end

class String
  OPERANDS = ['+', '-', '*', '/']

  def numeric?
    Float(self) != nil rescue false
  end

  def operand?
    OPERANDS.include?(self)
  end
end

class Object
  def execute(method_name, params)
    self.method(method_name).call(*params)
  end
end