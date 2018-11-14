require_relative 'ror13'
require 'test/unit'

class TestRor13 < Test::Unit::TestCase

  def test_change1
    assert_equal "uryyb", "hello".ror13 
  end

  def test_change2
    assert_equal "urwany hejnal", "hejnal urwany".ror13
  end

  def test_change3
    assert_equal "tekst", "tekst".ror13.ror13
  end

  def test_change4
    assert_equal "", "".ror13  
  end

  def test_change5 
    assert_equal "uRYyb", "hELlo".ror13 
  end

  def test_change6  
    assert_equal "a", "a".ror13.ror13
  end

  def test_change7
    assert_raise(ArgumentError.new("polish letters not allowed")) {"ą".ror13} 
  end

  def test_change8  
    assert_raise(ArgumentError.new("numbers not allowed")) {"1".ror13}   
  end 
end

