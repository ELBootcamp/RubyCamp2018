class PositiveCalculator

  def add(string_numbers)
    string_numbers.empty? ? 0 : handle_addiction(string_numbers) 
  end

  def subtract(string_numbers)
    string_numbers.empty? ? 0 : handle_subtraction(string_numbers) 
  end

  private 

  def handle_addiction(string_numbers)
    if string_numbers[0..1] == '//'
      sum = 0.0
      string_numbers = string_numbers[2..-1].split('\n')
      delimiter = string_numbers.first
      string_numbers = string_numbers.last
      string_numbers.split(delimiter).each do |element| 
        raise_error_if_negative_input(string_numbers)
        element = "0" if element.to_f > 1000
        sum += element.to_f
      end      
      sum
    else 
      sum = 0.0
      string_numbers = string_numbers.tr('\n', ',')
      raise_error_if_not_enough_numbers(string_numbers)
      string_numbers.split(',').each do |element| 
        raise_error_if_negative_input(element)
        element = "0" if element.to_f > 1000
        sum += element.to_f
      end
      sum
    end
  end

  def handle_subtraction(string_numbers)
    if string_numbers[0..1] == '//'
      subtract_sum = 0.0
      string_numbers = string_numbers[2..-1].split('\n')
      delimiter = string_numbers.first
      string_numbers = string_numbers.last
      string_numbers.split(delimiter)[1..-1].each do |element| 
        raise_error_if_negative_input(element)
        element = "0" if element.to_f > 1000
        subtract_sum += element.to_f 
      end      
      subtraction_result = string_numbers.split(delimiter).first.to_f - subtract_sum
      raise NegativesNotAllowed if subtraction_result < 0

      subtraction_result
    else 
      subtract_sum = 0.0
      string_numbers = string_numbers.tr('\n', ',')
      raise_error_if_not_enough_numbers(string_numbers)
      string_numbers.split(',')[1..-1].each do |element| 
        raise NegativesNotAllowed if element.to_f.negative?
        p element.to_f
        element = "0" if element.to_f > 1000
        subtract_sum += element.to_f
      end
      raise_error_if_negative_input(string_numbers)
      subtraction_result = string_numbers.split(',').first.to_f - subtract_sum
      raise NegativesNotAllowed if subtraction_result < 0

      subtraction_result
    end
  end

  def raise_error_if_negative_input(input)
    raise NegativesNotAllowed if input.split(',').first.to_f.negative?
  end

  def raise_error_if_not_enough_numbers(input)
    raise NotEnoughNumbers if input.split(',').length <= 1
  end
end

class NotEnoughNumbers < StandardError; end 
class NegativesNotAllowed < StandardError; end