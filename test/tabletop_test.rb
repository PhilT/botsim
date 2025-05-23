require "minitest/autorun"
require_relative "tabletop"

class TestTabletop < Minitest::Test
  def setup
    @tabletop_size = 5
    @tabletop = Tabletop.new @tabletop_size
  end

  def test_valid_tabletop
    assert @tabletop.valid?(0, 0, "NORTH")
    assert @tabletop.valid?(@tabletop_size - 1, @tabletop_size - 1, "NORTH")
  end

  def test_that_x_less_then_0_is_invalid
    refute @tabletop.valid?(-1, 0, "NORTH")
  end

  def test_that_y_less_then_0_is_invalid
    refute @tabletop.valid?(0, -1, "NORTH")
  end

  def test_that_x_more_than_size_is_invalid
    refute @tabletop.valid?(@tabletop_size, 0, "NORTH")
  end

  def test_that_y_more_than_size_is_invalid
    refute @tabletop.valid?(0, @tabletop_size, "NORTH")
  end

  def test_that_an_unknown_direction_is_invalid
    refute @tabletop.valid?(0, 0, "INVALID")
  end
end

