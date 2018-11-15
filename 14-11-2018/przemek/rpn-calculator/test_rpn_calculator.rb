require('test/unit')
require_relative('rpn_calculator')

class TestRpnCalculator < Test::Unit::TestCase

  def test_rpn_match
    assert_equal 4, RpnCalculator.calculate('1 3 +')
    assert_equal 12, RpnCalculator.calculate('2 2 + 3 *')
    assert_equal 8, RpnCalculator.calculate('3 1 - 2 2 + *')
    assert_equal 23, RpnCalculator.calculate('4 3 4 + 5 1 + 2 * + +')
    assert_equal 5, RpnCalculator.calculate('15 7 1 1 + - / 3 * 2 1 1 + + -')
  end

  def test_rpn_input
    assert_raise (InvalidExpression) { RpnCalculator.calculate('abc') }
    assert_raise (InvalidExpression) { RpnCalculator.calculate('') }
    assert_raise (NotEnoughtOperands) { RpnCalculator.calculate('1 +') }
  end
end