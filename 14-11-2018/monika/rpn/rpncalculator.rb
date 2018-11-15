class RpnCalculator 

  def calculate(expression)
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
end

p RpnCalculator.new.calculate("3 1 - 2 2 + *")
