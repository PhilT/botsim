# No output specified to show before valid place command
require_relative './tabletop'

class Botsim
  def initialize(tabletop = Tabletop.new(5))
    @tabletop = tabletop
  end

  def place(x, y, direction)
    return unless @tabletop.valid?(x, y, direction)

    @x = x
    @y = y
    @direction = direction
  end

  def report
    return unless @x
    "#{@x},#{@y},#{@direction}"
  end
end
