require "minitest/autorun"
require_relative "../lib/botsim"

class SystemTest < Minitest::Test
  def test_with_example_input
    input = File.read("data/input.txt")
    output = File.read("data/output.txt").split("\n")
    assert_equal output, Botsim.new.process(input)
  end

  def test_with_dubious_input
    input = File.read("data/dubious_input.txt")
    output = File.read("data/dubious_output.txt").split("\n")
    assert_equal output, Botsim.new.process(input)
  end
end
