require_relative 'positive_calculator'
require 'test/unit'

class TestPositiveCalculator < Test::Unit::TestCase

  def test_add_method
    assert_equal 0, PositiveCalculator.new.add("")
  end

  def test_add_numbers
    assert_equal 21, 
    PositiveCalculator.new.add('1,5,5,4,6s')
  end

  def test_new_line_separator_support
    assert_equal 6, 
    PositiveCalculator.new.add('1\n2\n3')
  end

  def test_not_enough_numbers_error
    assert_raise NotEnoughNumbers do
       PositiveCalculator.new.add('1\n')
    end
  end

  def test_add_method_delimiter
    assert_equal 3, 
    PositiveCalculator.new.add('//;\n1;2')
  end

end