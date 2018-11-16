class RpnCalculator
  OPERATORS = %w[+ - * /].freeze

  def initialize(input)
    @input = input
    @stack = []
  end

  attr_accessor :input, :stack

  def result
    input_array.empty? && raise(InvalidExpression)

    input_array.each { |element| raise InvalidExpression unless handle_input(element) }

    stack_last_element
  end

  private

  def input_array
    @input_array ||= input.split(' ')
  end

  def handle_input(input)
    handle_numeric(input) || (OPERATORS.include?(input) && handle_operator(input))
  end

  def handle_operator(input)
    raise NotEnoughOperands unless stack.length >= 2

    stack_value(evaluate_expression(input))
  end

  def handle_numeric(input)
    input =~ /\d+/ && stack << input.to_f
  end

  def evaluate_expression(operand)
    case operand
    when '+' then stack_penultimate_element + stack_last_element
    when '-' then stack_penultimate_element - stack_last_element
    when '*' then stack_penultimate_element * stack_last_element
    else
      stack_penultimate_element / stack_last_element
    end
  end

  def stack_last_element
    stack[-1]
  end

  def stack_penultimate_element
    stack[-2]
  end

  def stack_value(temp_value)
    stack.pop(2)
    stack << temp_value
  end
end

class NotEnoughOperands < StandardError; end

class InvalidExpression < StandardError; end
