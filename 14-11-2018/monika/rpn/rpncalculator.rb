class RpnCalculator 

  def calculate(expression)

    #while expression != "" do
      delimiters = ['+', '-', "*","%"]
      stack = expression.split(Regexp.union(delimiters)).first
      expression = expression.sub(stack,"")
      stack.split("")
      if expression[0].include? "+" && stack.length >=2 {stack.last + stack[stack.length-1]}
      else "bla"

    #end
  end
end  


p RpnCalculator.new.calculate("54+2+5,67")
