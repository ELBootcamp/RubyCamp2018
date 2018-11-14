class TestRot13 < Test::Unit::TestCase

  def test_rot13_match
    assert_equal 'uryyb', 'hello'.rot13
    assert_equal 'urwany hejnal', 'hejnal urwany'.rot13
    assert_equal 'a', 'a'.rot13.rot13
  end

  def test_rot13_input
    assert_equal '', ''.rot13
    assert_raise ArgumentError { 'ą'.rot13 }
    assert_raise ArgumentError { '1sdsdds'.rot13 }
  end

  def test_rot13_case_sensitive
    assert_equal 'PrPr sebt', 'PePe frog'.rot13
  end
end