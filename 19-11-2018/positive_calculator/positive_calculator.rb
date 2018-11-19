class PositiveCalculator

  def add(string_numbers)
    if string_numbers.empty?
      0 
    else 
      sum = 0.0
      string_numbers = string_numbers.tr('\n', ',')
      raise NotEnoughNumbers if string_numbers.split(',').length <=1   
      string_numbers.split(',').each do |element| 
        sum += element.to_f
      end
      sum
    end

  end

end

class NotEnoughNumbers < StandardError; end 