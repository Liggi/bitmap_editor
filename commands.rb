require_relative 'commands/command_base'
require_relative 'commands/default_command'
require_relative 'commands/exit_editor'
require_relative 'commands/vertical_segment'
require_relative 'commands/horizontal_segment'
require_relative 'commands/empty_command'

module Commands
  COMMANDS = {
    'x' => ExitEditor,
    'v' => VerticalSegment,
    'h' => HorizontalSegment
  }

  def self.for(input)
    return EmptyCommand.new if input.empty?
    COMMANDS.fetch(input[0], DefaultCommand).new(input)
  end
end
