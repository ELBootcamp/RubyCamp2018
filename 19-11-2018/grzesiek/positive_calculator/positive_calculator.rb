require 'byebug'

class PositiveCalculator

  def add(string_numbers)
    string_numbers.empty? ? 0 : handle_addiction(string_numbers)
  end

  def subtract(string_numbers)
    string_numbers.empty? ? 0 : handle_subtraction(string_numbers)
  end

  private

  def handle_addiction(string_numbers)
    if string_numbers.start_with?('//')
      string_numbers = string_numbers[2..-1].split('\n')
      sanitized_numbers = string_numbers.last.split(string_numbers.first).map(&:to_f)
      a = sanitized_numbers.map do |number|
        raise NegativesNotAllowed if number.negative?
        number > 1000 ? 0 : number
      end
    else
      string_numbers = string_numbers.tr('\n', ',')
      raise NotEnoughNumbers if string_numbers.split(',').length <= 1
      sanitized_numbers = string_numbers.split(',').map(&:to_f)
      a = sanitized_numbers.map do |number|
        raise NegativesNotAllowed if number.negative?
        number > 1000 ? 0 : number
      end
    end
    sum = a.reduce(&:+)
  end

  def handle_subtraction(string_numbers)
    if string_numbers.start_with?('//')
      string_numbers = string_numbers[2..-1].split('\n')
      sanitized_numbers = string_numbers.last.split(string_numbers.first).map(&:to_f)
      a = sanitized_numbers.map do |number|
        raise NegativesNotAllowed if number.negative?
        number > 1000 ? 0 : number
      end
    else
      string_numbers = string_numbers.tr('\n', ',')
      raise NotEnoughNumbers if string_numbers.split(',').length <= 1
      sanitized_numbers = string_numbers.split(',').map(&:to_f)
      a = sanitized_numbers.map do |number|
        raise NegativesNotAllowed if number.negative?
        number > 1000 ? 0 : number
      end
    end
    subtraction_result = a.reduce(&:-)
    subtraction_result < 0 ? raise(NegativesNotAllowed) : subtraction_result
  end
end

class NegativesNotAllowed < StandardError; end
class NotEnoughNumbers < StandardError; end