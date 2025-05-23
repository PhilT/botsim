require "minitest/autorun"
require_relative "../lib/botsim"

class TestSystem < Minitest::Test
  def setup
    @input = File.read("data/input.txt")
    @output = File.read("data/output.txt").split("\n")
  end

  def test_end_to_end
    botsim = Botsim.new
    assert_equal @output, botsim.process(@input)
  end
end
