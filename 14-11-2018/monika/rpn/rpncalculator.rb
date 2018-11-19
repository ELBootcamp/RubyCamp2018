class RpnCalculator 

  def calculate(expression)

    if expression == "" 
      raise InvalidExpression
    elsif expression.split("").none? {|element| element =~ /\d/}
      raise InvalidExpression
    elsif expression.number_of_operands + 1 != expression.number_of_digits 
      raise NotEnoughOperands
    end
  
    stack= []
    while expression.gsub(/\s+/, "") != "" do

      stack += expression.change.split(" ")
      expression = expression.sub(expression.change,"")

      if expression != ""
        operand = expression[0]
        stack << eval(stack[-2]+operand+stack[-1]).to_s if eval(stack[-1]+operand+stack[-2])
        stack.delete_at(-2)
        stack.delete_at(-2)
        expression = expression[1..-1]
      end
    end

    result=stack.join("").to_i

  end

end  

class String 

  def change 
    delimiters = ['+', '-', "*","%"]
    self.split(Regexp.union(delimiters)).first
  end

  def number_of_operands
    delimiters = "+-*%"
    self.split("").select {|element| delimiters.include? element}.length
  end

  def number_of_digits
    digits = "0123456789"
    self.split("").select {|element| digits.include? element}.length
  end

end

class InvalidExpression < StandardError

end

class NotEnoughOperands < StandardError

end




