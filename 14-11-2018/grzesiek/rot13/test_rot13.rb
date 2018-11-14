require_relative 'rot13'
require 'test/unit'

class TestRot13 < Test::Unit::TestCase

  def test_string_is_nil
    assert_equal "String is nil", nil.rot13
  end
  
  def test_string_is_empty
    assert_equal "String is empty", ''.rot13
  end

  def test_string_includes_wrong_input
    assert_raise ArgumentError { 'ą'.rot13 } 
    assert_raise ArgumentError { '1hello'.rot13 } 
    assert_raise ArgumentError { '_hello'.rot13 } 
  end

  def test_string_has_capital_letter
    assert_equal "UryyB", 'HellO'.rot13
  end

  def test_rot13
    assert_equal 'uryyb', 'hello'.rot13
    assert_equal 'hejnal urwany', 'urwany hejnal'.rot13
    assert_equal 'tekst', 'tekst'.rot13.rot13
  end
  
end