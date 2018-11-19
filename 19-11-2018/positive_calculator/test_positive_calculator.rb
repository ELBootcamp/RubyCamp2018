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

end