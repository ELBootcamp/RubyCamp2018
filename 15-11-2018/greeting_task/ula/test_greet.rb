require 'test/unit'
require_relative 'greet'

class TestGreet < Test::Unit::TestCase
  def test_one_name
    assert_equal 'Hello, Bob.', greeter.greet('Bob')
  end

  def test_nil_name
    assert_equal 'Hello, my friend.', greeter.greet(nil)
  end

  def test_upcase_name
    assert_equal 'HELLO JERRY.', greeter.greet('JERRY')
  end

  def test_two_names
    assert_equal 'Hello, Jill and Jane.',
                 greeter.greet(%w[Jill Jane])
  end

  def test_multiple_names
    assert_equal 'Hello, Amy, Brian, and Charlotte.',
                 greeter.greet(%w[Amy Brian Charlotte])
  end

  def test_different_name_cases
    assert_equal 'Hello, Amy and Charlotte. AND HELLO BRIAN!',
                 greeter.greet(%w[Amy BRIAN Charlotte])
  end

  def test_names_split
    assert_equal 'Hello, Bob, Charlie, and Dianne.',
                 greeter.greet(['Bob', 'Charlie, Dianne'])
  end

  def test_names_with_double_quotes
    assert_equal 'Hello, Bob and Charlie, Dianne.',
                 greeter.greet(['Bob', '"Charlie, Dianne"'])
  end

  def greeter
    @greeter ||= Greet.new
  end
end
