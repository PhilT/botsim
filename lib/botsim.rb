# No output specified to show before valid place command
require_relative './tabletop'

class Botsim
  MOVES = {
    "NORTH" => [0, 1],
    "SOUTH" => [0, -1],
    "EAST" => [1, 0],
    "WEST" => [-1, 0]
  }

  def initialize(tabletop = Tabletop.new(5))
    @tabletop = tabletop
    @placed = false
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

    @placed = true
    @x = x
    @y = y
    @direction = direction
  end

  def report
    return unless @placed

    "#{@x},#{@y},#{@direction}"
  end

  def move
    return unless @placed

    x = @x + MOVES[@direction].first
    y = @y + MOVES[@direction].last
    return unless @tabletop.valid?(x, y, @direction)

    @x = x
    @y = y
  end

  def left
    turn -1
  end

  def right
    turn 1
  end

  private

  def turn(inc)
    return unless @placed

    new_index = Tabletop::DIRECTIONS.index(@direction) + (1 * inc)
    @direction = Tabletop::DIRECTIONS[new_index]
  end

  def valid_command?(command)
    %w[PLACE MOVE LEFT RIGHT REPORT].include?(command)
  end
end
