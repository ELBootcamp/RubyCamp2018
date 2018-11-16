require_relative 'rpn_calculator'
require 'test/unit'

class TestRpnCalculator < Test::Unit::TestCase

  def test_enough_operands_number
    number = RpnCalculator.new('1 +')
    assert_raise NotEnoughOperands do
      number.result
    end
  end

  def test_invalid_expression_abc
    number = RpnCalculator.new('abc')
    assert_raise InvalidExpression do
      number.result
    end
  end

  def test_invalid_expression_empty
    number = RpnCalculator.new('')
    assert_raise InvalidExpression do
      number.result
    end
  end

  def test_result4
    number = RpnCalculator.new('1 3 +')
    assert_equal 4, number.result
  end

  def test_result12
    number = RpnCalculator.new('2 2 + 3 *')
    assert_equal 12, number.result
  end

  def test_result8
    number = RpnCalculator.new('3 1 - 2 2 + *')
    assert_equal 8, number.result
  end

  def test_result23
    number = RpnCalculator.new('4 3 4 + 5 1 + 2 * + +')
    assert_equal 23, number.result
  end

  def test_result5
    number = RpnCalculator.new('15 7 1 1 + - / 3 * 2 1 1 + + -')
    assert_equal 5, number.result
  end
end
