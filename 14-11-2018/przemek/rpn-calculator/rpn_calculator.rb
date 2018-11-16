class RpnCalculator
  OPERANDS = ['+', '-', '*', '/']

  def self.calculate(expression)
    stack = []
    raise InvalidExpression if expression.empty?

    expression.split(' ').each do |element|
      raise InvalidExpression unless valid_operand?(element) || element.numeric?

      unless valid_operand?(element)
        stack.push(element.to_f)
      else
        values = stack.pop, stack.pop
        raise NotEnoughtOperands if values.any?(&:nil?)

        stack.push((values.last).execute(element, values.first))
      end
    end
    stack.first
  end

  def self.valid_operand?(element)
    OPERANDS.include?(element)
  end
end

class InvalidExpression < StandardError; end
class NotEnoughtOperands < StandardError; end

class String
  
  def numeric?
    Float(self) != nil rescue false
  end
end

class Object

  def execute(method_name, params)
    self.method(method_name).call(*params)
  end
end
