require "minitest/autorun"
require "./lib/botsim"

class BotsimTest < Minitest::Test
  def setup
    @botsim = Botsim.new
  end

  def test_that_process_ignores_invalid_command
    assert_equal [], @botsim.process("SOMETHING\nREPORT")
  end

  def test_that_process_iterates_through_commands
    output = @botsim.process("PLACE 0,0,NORTH\nREPORT")
    assert_equal ["0,0,NORTH"], output
  end

  def test_that_process_handles_additional_spaces
    output = @botsim.process("PLACE 0,0,NORTH\nREPORT \n")
    assert_equal ["0,0,NORTH"], output
  end

end
