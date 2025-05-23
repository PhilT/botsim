# No output specified to show before valid place command
require_relative "./tabletop"
require_relative "./bot"

class Botsim
  VALID_COMMANDS = %w[PLACE MOVE LEFT RIGHT REPORT].freeze

  def initialize(validator = Tabletop.new(5))
    @bot = Bot.new(validator)
  end

  def process(commands)
    commands.split("\n").filter_map do |line|
      if line.start_with? "PLACE "
        _, x, y, direction = line.split(/PLACE ([0-9]+),([0-9]+),(.+)/)

        @bot.place(x.to_i, y.to_i, direction)
        nil
      else 
        command = line.strip
        next unless valid_command?(command)

        output = @bot.send(command.downcase)
        output if command == "REPORT"
      end
    end
  end

  private

  def valid_command?(command)
    VALID_COMMANDS.include?(command)
  end
end
