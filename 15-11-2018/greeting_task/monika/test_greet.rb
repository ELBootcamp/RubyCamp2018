require 'test/unit'
require_relative 'greet'

class TestGreet < Test::Unit::TestCase

  def test_greet
    assert_equal "Hello, Bob.", Greet.new.greet("Bob")
  end

  def test_greet_nil
    assert_equal "Hello, my friend.", Greet.new.greet(nil)
  end

  def test_greet_name_upcase
    assert_equal "HELLO JERRY.", Greet.new.greet("JERRY")
  end

  def test_greet_two_names
    assert_equal "Hello, Jill and Jane.", 
    Greet.new.greet(["Jill","Jane"])
  end

  def test_greet_multiple_names
    assert_equal "Hello, Amy, Brian, and Charlotte.", 
    Greet.new.greet(["Amy", "Brian", "Charlotte"])
  end

  def test_greet_names_different_cases
    assert_equal "Hello, Amy and Charlotte. AND HELLO BRIAN!", 
    Greet.new.greet(["Amy", "BRIAN", "Charlotte"])
  end

  def test_greet_names_split
    assert_equal "Hello, Bob, Charlie, and Dianne.", 
    Greet.new.greet(["Bob", "Charlie, Dianne"])
  end
  
  def test_greet_names_double_quotes
    assert_equal "Hello, Bob and Charlie, Dianne.", 
    Greet.new.greet(["Bob", '"Charlie, Dianne"'])
  end
end
