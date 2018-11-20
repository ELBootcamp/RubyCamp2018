require 'byebug'

class PositiveCalculator

  def add(string_numbers)   
    return 0 if string_numbers.empty?
    string_numbers[0..1] == '//' && string_numbers = change_slash_to_comma(string_numbers)
    calculate_sum(string_numbers.tr('\n', ','))       
  end

  def subtract(string_numbers)
    return 0 if string_numbers.empty?
    string_numbers[0..1] == '//' && string_numbers = change_slash_to_comma(string_numbers)
    string_numbers = string_numbers.tr('\n', ',') 
    subtraction_result = string_numbers.split(',').first.to_f - calculate_sum(string_numbers[1..-1]) 
    subtraction_result < 0 ? raise(NegativesNotAllowed) : subtraction_result  
  end

  def change_slash_to_comma(string_to_change)
    string_to_change = string_to_change[2..-1].split('\n')
    string_to_change.last.tr(string_to_change.first, ',')
  end

  def calculate_sum(numbers)
    sum = 0.0
    raise NotEnoughNumbers if numbers.split(',').length <= 1  
    raise NegativesNotAllowed if numbers.split(",").map(&:to_f).any?(&:negative?) 
    numbers.split(',').each do |element| 
      element = "0" if element.to_f > 1000
      sum += element.to_f
    end
    sum
  end

  def change_to_comma(string_to_change)
    string_numbers[0..1] == '//' && string_numbers = change_slash_to_comma(string_numbers)
    string_numbers = string_numbers.tr('\n', ',') 
  end

end

class NotEnoughNumbers < StandardError; end 
class NegativesNotAllowed < StandardError; end