class PositiveCalculator

  def add(string_numbers)
    if string_numbers.empty?
      0
    elsif string_numbers[0..1] == '//'
      sum = 0.0
      string_numbers = string_numbers[2..-1].split('\n')
      delimiter = string_numbers.first
      string_numbers = string_numbers.last
      string_numbers.split(delimiter).each do |element| 
        raise NegativesNotAllowed if element.to_f.negative?  
        element = "0" if element.to_f > 1000
        sum += element.to_f
      end      
      sum
    else 
      sum = 0.0
      string_numbers = string_numbers.tr('\n', ',')
      raise NotEnoughNumbers if string_numbers.split(',').length <=1   
      string_numbers.split(',').each do |element| 
        raise NegativesNotAllowed if element.to_f.negative?
        element = "0" if element.to_f > 1000
        sum += element.to_f
      end
      sum
    end

  end

end

class NotEnoughNumbers < StandardError; end 
class NegativesNotAllowed < StandardError; end