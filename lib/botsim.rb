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
      command, x, y, direction = line.split(/ |,/).reject(&:empty?)
      next unless valid_command?(command)

      if command == "PLACE"
        @bot.place(x.to_i, y.to_i, direction)
      else 
        output = @bot.send(command.downcase)
      end
      output if command == "REPORT"
    end
  end

  private

  def valid_command?(command)
    VALID_COMMANDS.include?(command)
  end
end
