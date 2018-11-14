require_relative('rpn')
require('test/unit')

class TestRpnCalculator < Test::Unit::TestCase
  def test_calculate_proper_cases
    assert_equal 4, RpnCalculator.new.calculate("1 3 +")
    assert_equal 12, RpnCalculator.new.calculate("2 2 + 3 *")
    assert_equal 8, RpnCalculator.new.calculate("3 1 - 2 2 + *")
    assert_equal 23, RpnCalculator.new.calculate("4 3 4 + 5 1 + 2 * + +")
  end

  def test_calculate_edge_cases
    assert_raise (InvalidExpression.new("Invalid expression")), { RpnCalculator.new.calculate("") }
    assert_raise (InvalidExpression.new("Invalid expression")), { RpnCalculator.new.calculate("abc") }
    assert_raise (NotEnoughOperands.new("Not enough operands")), { RpnCalculator.new.calculate("abc") }
  end
end