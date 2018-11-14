require_relative 'rot13'
require 'test/unit'

class TestRot13 < Test::Unit::TestCase
  
  def test_string_is_empty
    assert_equal "String is empty", ''.rot13
  end

  def test_string_includes_wrong_input
    assert_raise (ArgumentError.new("Wrong character in your string")) { 'ą'.rot13 } 
    assert_raise (ArgumentError.new("Wrong character in your string")) { '1'.rot13 } 
    assert_raise (ArgumentError.new("Wrong character in your string")) { '_'.rot13 } 
  end

  def test_string_has_capital_letter
    assert_equal "UryyB", 'HellO'.rot13
  end

  def test_rot13_with_appropriate_strings
    assert_equal 'uryyb', 'hello'.rot13
    assert_equal 'hejnal urwany', 'urwany hejnal'.rot13
    assert_equal 'tekst', 'tekst'.rot13.rot13
  end
  
end
