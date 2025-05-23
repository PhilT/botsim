require "minitest/autorun"
require "./lib/botsim"

class TestBotsim < Minitest::Test
  def setup
    @bot = Botsim.new
  end

  def test_that_place_sets_x_y_and_direction
    @bot.place 0, 0, "NORTH"
    assert_equal "0,0,NORTH", @bot.report
  end

  def test_that_place_ignores_invalid_parameters
    @bot.place -5, 0, "NORTH"
    assert_nil @bot.report
  end

  def test_that_report_ignored_before_call_to_place
    assert_nil @bot.report
  end
end
