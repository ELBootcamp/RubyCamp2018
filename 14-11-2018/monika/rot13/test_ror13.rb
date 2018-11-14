require_relative 'ror13'
require 'test/unit'

class TestRor13 < Test::Unit::TestCase

  def test_change
    assert_equal "uryyb", "hello".ror13 
    assert_equal "urwany hejnal", "hejnal urwany".ror13
    assert_equal "tekst", "tekst".ror13.ror13
    assert_equal "", "".ror13   
    assert_equal nil, nil.ror13
    assert_equal "uRYyb", "hELlo".ror13   
    assert_equal "a", "a".ror13.ror13
    assert_raise ArgumentError {"ą".ror13}   
    assert_raise ArgumentError {"1".ror13}   

  end 
end