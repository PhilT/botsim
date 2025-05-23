# No output specified to show before valid place command
require_relative './tabletop'

class Botsim
  def initialize(tabletop = Tabletop.new(5))
    @tabletop = tabletop
  end

  def process(input)
    input.split("\n").filter_map do |line|
      if line.start_with? "PLACE "
        _, x,y, direction = line.split(/PLACE ([0-9]+),([0-9]+),(.+)/)

        place(x.to_i, y.to_i, direction)
        nil
      else 
        command = line.strip
        next unless valid_command?(command)

        output = send(command.downcase)
        output if command == "REPORT"
      end
    end
  end

  def place(x, y, direction)
    return unless @tabletop.valid?(x, y, direction)

    @x = x
    @y = y
    @direction = direction
  end

  def report
    return if @x.nil?
    "#{@x},#{@y},#{@direction}"
  end

  private

  def valid_command?(command)
    %w[PLACE MOVE LEFT RIGHT REPORT].include?(command)
  end
end

