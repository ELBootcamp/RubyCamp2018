require_relative 'positive_calculator'
require 'test/unit'

class TestPositiveCalculator < Test::Unit::TestCase

  def test_add_method
    assert_equal 0, PositiveCalculator.new.add("")
  end

end