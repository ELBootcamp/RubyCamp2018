class PositiveCalculator

  def add(string_numbers)
    calc_expression(string_numbers)
  end

  def subtract(string_numbers)
    calc_expression(string_numbers, '-')
  end

private 

  def calc_expression(string_numbers, method_string = '+')
    return 0 if string_numbers.empty? 

    delimiter, string_numbers = set_delimiter(string_numbers)

    delimiter ||= ','

    string_numbers = string_numbers.tr('\n', ',')

    raise NotEnoughNumbers if string_numbers.split(delimiter).length <=1   
    result = string_numbers.split(delimiter).map(&:to_f).each.with_index.reduce(0) do |sum, (element, i)| 
      raise NegativesNotAllowed if element.negative?
      next sum = element if i == 0  
      
      element = 0 if element > 1000
      if(method_string == '+') 
        sum += element
      else
        sum -= element
      end

    end 

    result.negative? ? (raise NegativesNotAllowed) : result
  end

  def set_delimiter(string_numbers) 
    if string_numbers[0..1] == '//'
      string_numbers = string_numbers[2..-1].split('\n')
      delimiter = (string_numbers.first || ',')
      string_numbers = string_numbers.last
    end

    [delimiter, string_numbers]
  end

end

class NotEnoughNumbers < StandardError; end 
class NegativesNotAllowed < StandardError; end