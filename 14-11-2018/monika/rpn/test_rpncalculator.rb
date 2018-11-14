require_relative 'rpncalculator'
require 'test/unit'

class TestRpnCalculator < Test::Unit::TestCase
  def test_calculation1
    assert_equal 12, RpnCalculator.new.calculate("2 2 + 3")
  end
  
  def test_calculation2
    assert_equal 4, RpnCalculator.new.calculate("1 3 +")
  end 
  
  def test_calculation3
    assert_equal 8, RpnCalculator.new.calculate("3 1 - 2 2 +")
  end

  def test_calculation4
    assert_equal 23, RpnCalculator.new.calculate("4 3 4 + 5 1 + 2 * + +")
  end 

  def test_not_enough_operands  
    assert_raise(NotEnoughOperands.new) {RpnCalculator.new.calculate("1 +")}   
  end 

  def test_invalid_expression1  
    assert_raise(InvalidExpression.new) {RpnCalculator.new.calculate("")}    
  end 

  def test_invalid_expression2  
    assert_raise(InvalidExpression.new) {RpnCalculator.new.calculate("abc")}     
  end 
end 
