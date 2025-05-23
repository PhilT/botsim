class Tabletop
  DIRECTIONS = %w[NORTH EAST SOUTH WEST].freeze

  def initialize(size)
    @size = size
  end

  def valid?(x, y, direction)
    x >= 0 && x < @size &&
      y >= 0 && y < @size && 
      DIRECTIONS.include?(direction)
  end
end
