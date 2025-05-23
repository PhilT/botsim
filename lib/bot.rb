class Bot
  MOVES = {
    "NORTH" => [0, 1],
    "SOUTH" => [0, -1],
    "EAST" => [1, 0],
    "WEST" => [-1, 0]
  }.freeze

  def initialize(validator)
    @validator = validator
    @placed = false
  end

  def place(x, y, direction)
    return unless @validator.valid?(x, y, direction)

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
    return unless @validator.valid?(x, y, @direction)

    @x = x
    @y = y
  end

  def left
    turn(-1)
  end

  def right
    turn(1)
  end

  private

  def turn(inc)
    return unless @placed

    new_index = Tabletop::DIRECTIONS.index(@direction) + (1 * inc)
    @direction = Tabletop::DIRECTIONS[new_index]
  end
end
