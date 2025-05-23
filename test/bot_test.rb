require "minitest/autorun"
require "./lib/bot"

class BotTest < Minitest::Test
  def setup
    @bot = Bot.new(Tabletop.new(5))
  end

  def test_that_place_sets_x_y_and_direction
    @bot.place(0, 0, "NORTH")
    assert_equal "0,0,NORTH", @bot.report
  end

  def test_that_place_ignores_invalid_parameters
    @bot.place(-5, 0, "NORTH")
    assert_nil @bot.report
  end

  def test_that_move_moves_forward_one_unit
    @bot.place(0, 0, "NORTH")
    @bot.move
    assert_equal "0,1,NORTH", @bot.report
  end

  def test_that_move_is_ignored_before_place
    @bot.move
    assert_nil @bot.report
  end

  def test_that_left_is_ignored_before_place
    @bot.left
    assert_nil @bot.report
  end

  def test_that_right_is_ignored_before_place
    @bot.right
    assert_nil @bot.report
  end

  def test_that_move_ignore_invalid_move
    @bot.place(0, 0, "SOUTH")
    @bot.move
    assert_equal "0,0,SOUTH", @bot.report
  end

  def test_that_left_sets_the_previous_direction
    @bot.place(0, 0, "SOUTH")
    @bot.left
    assert_equal "0,0,EAST", @bot.report
  end

  def test_that_left_sets_the_last_direction_when_on_the_first
    @bot.place(0, 0, "NORTH")
    @bot.left
    assert_equal "0,0,WEST", @bot.report
  end

  def test_that_report_ignored_before_call_to_place
    assert_nil @bot.report
  end
end
