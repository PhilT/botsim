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

  def move
    x = @x + MOVES[@direction].first
    y = @y + MOVES[@direction].last
    return unless @tabletop.valid?(x, y, @direction)

    @x = x
    @y = y
  end

  # FIXME: Double check wrap-around is working
  def left
    new_index = Tabletop::DIRECTIONS.index(@direction) - 1
    @direction = Tabletop::DIRECTIONS[new_index]
  end

  def right
    new_index = Tabletop::DIRECTIONS.index(@direction) + 1
    @direction = Tabletop::DIRECTIONS[new_index]
  end

  private

  def valid_command?(command)
    %w[PLACE MOVE LEFT RIGHT REPORT].include?(command)
  end
end

