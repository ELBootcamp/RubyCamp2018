require 'test/unit'
require_relative "rot_13.rb"

class TestRot13 < Test::Unit::TestCase
  
  def test_matches
    assert_equal("uryyb", "hello".rot13)
    assert_equal("urwany hejnal", "hejnal urwany".rot13)
    assert_equal("hello", "hello".rot13.rot13)
    assert_equal("uryyb", "HELLO".rot13)
  end

  def test_empty_string
    assert_equal("", "".rot13)
  end

  def test_wrong_type
    assert_raise(NoMethodError) {nil.rot13}    
    assert_raise(NoMethodError) {1.rot13}
  end

  def test_not_english_alphabet
    assert_raise(StandardError.new("unknown chars")) {"ą".rot13}
    assert_raise(StandardError.new("unknown chars")) {"1".rot13}
    assert_raise(StandardError.new("unknown chars")) {"123dfggree".rot13}
  end

end
