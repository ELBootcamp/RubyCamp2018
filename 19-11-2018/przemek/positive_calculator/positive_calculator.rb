class PositiveCalculator

  def add(string_numbers)
    return 0 if string_numbers.empty? 
    delimiter = ','

    if string_numbers[0..1] == '//'
      string_numbers = string_numbers[2..-1].split('\n')
      delimiter = (string_numbers.first || ',')
      string_numbers = string_numbers.pop
    end

    string_numbers = string_numbers.tr('\n', ',')

    raise NotEnoughNumbers if string_numbers.split(delimiter).length <=1   
    string_numbers.split(delimiter).map(&:to_f).each.with_index.reduce(0) do |sum, (element, i)| 
      raise NegativesNotAllowed if element.negative?
      next sum = element if i == 0  
      
      element = 0 if element > 1000
      sum += element
    end

  end

  def subtract(string_numbers)
    if string_numbers.empty?
      0
    elsif string_numbers[0..1] == '//'
      subtract_sum = 0.0
      string_numbers = string_numbers[2..-1].split('\n')
      delimiter = string_numbers.first
      string_numbers = string_numbers.last
      string_numbers.split(delimiter)[1..-1].each do |element| 
        raise NegativesNotAllowed if element.to_f.negative?  
        element = "0" if element.to_f > 1000
        subtract_sum += element.to_f 
      end      
      subtraction_result = string_numbers.split(delimiter).first.to_f - subtract_sum
      raise NegativesNotAllowed if subtraction_result < 0

      subtraction_result
    else 
      subtract_sum = 0.0
      string_numbers = string_numbers.tr('\n', ',')
      raise NotEnoughNumbers if string_numbers.split(',').length <=1   
      string_numbers.split(',')[1..-1].each do |element| 
        raise NegativesNotAllowed if element.to_f.negative?
        element = "0" if element.to_f > 1000
        subtract_sum += element.to_f
      end
      raise NegativesNotAllowed if string_numbers.split(',').first.to_f.negative?
      subtraction_result = string_numbers.split(',').first.to_f - subtract_sum
      raise NegativesNotAllowed if subtraction_result < 0

      subtraction_result
    end
  end

end

class NotEnoughNumbers < StandardError; end 
class NegativesNotAllowed < StandardError; end