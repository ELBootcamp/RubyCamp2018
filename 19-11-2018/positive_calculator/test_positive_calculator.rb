require_relative 'positive_calculator'
require 'test/unit'

class TestPositiveCalculator < Test::Unit::TestCase

  def test_add_method
    assert_equal 0, PositiveCalculator.new.add("")
  end

  def test_add_numbers
    assert_equal 21, 
    PositiveCalculator.new.add('1,5,5,4,6')
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

  def test_negatives
    assert_raise NegativesNotAllowed do
       PositiveCalculator.new.add('-2,1')
    end
  end

  def test_big_numbers
    assert_equal 1,
    PositiveCalculator.new.add('1,1001')
  end


  def test_subtract_numbers
    assert_equal 6, 
    PositiveCalculator.new.subtract('10,4')
  end

  def test_new_line_separator_support_subtract_method
    assert_equal 1, 
    PositiveCalculator.new.subtract('3\n1\n1')
  end

  def test_not_enough_numbers_error_subtract_method
    assert_raise NotEnoughNumbers do
       PositiveCalculator.new.subtract('1\n')
    end
  end

  def test_subtract_method_delimiter
    assert_equal 1, 
    PositiveCalculator.new.subtract('//;\n2;1')
  end

  def test_negatives_subtract_method
    assert_raise NegativesNotAllowed do
       PositiveCalculator.new.subtract('-2,1')
    end
  end

  def test_big_numbers_subtract_method
    assert_equal 1,
    PositiveCalculator.new.subtract('1,1001')
  end

end