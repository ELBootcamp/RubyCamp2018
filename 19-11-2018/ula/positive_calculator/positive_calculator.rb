require_relative 'custom_exceptions'
require 'byebug'

class PositiveCalculator
  def add(string_numbers)
    string_numbers.empty? ? 0 : filtered_numbers(string_numbers).reduce(&:+)
  end

  def subtract(string_numbers)
    return 0 if string_numbers.empty?

    result = filtered_numbers(string_numbers).reduce(&:-)
    result < 0 ? raise(NegativesNotAllowed) : result
  end

  private

  def filtered_numbers(string)
    if string.start_with?('//')
      split_input = split_input(string)
      filter(split_input[:actual_input], split_input[:delimiter])
    else
      filter(string.tr('\n', ','), ',')
    end
  end

  def filter(string, delimiter)
    NumbersFilter.new(string, delimiter).call
  end

  def split_input(string)
    split = string[2..-1].split('\n')

    { delimiter: split.first, actual_input: split.last }
  end
end

class NumbersFilter
  def initialize(input, delimiter)
    @input = input
    @delimiter = delimiter
  end

  attr_reader :input, :delimiter

  def call
    check_for_negatives
    check_numbers_count
    filter_large_numbers
  end

  private

  def check_for_negatives
    numeric_input.any?(&:negative?) && raise(NegativesNotAllowed)
  end

  def check_numbers_count
    numeric_input.length <= 1 && raise(NotEnoughNumbers)
  end

  def filter_large_numbers
    numeric_input.map { |input| input > 1000 ? 0 : input }
  end

  def numeric_input
    @numeric_input = input.split(delimiter).map(&:to_f)
  end
end
