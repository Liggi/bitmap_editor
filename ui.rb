require_relative 'exceptions'
require_relative 'editor'
require_relative 'canvas'

class UI

  attr_accessor :editor, :should_exit

  SYSTEM_MESSAGES = {
    empty_command: "Please enter a command.",
    unknown_command: "Unknown command.",
    exit_command: "Thanks for using the editor. Have a nice day!"
  }
  COMMANDS = {
    'x' => :exit_editor,
    'v' => :vertical_segment,
    'h' => :horizontal_segment
  }

  def initalize
    canvas = Canvas.new(6, 6)
    @editor = Editor.new(canvas)
    @should_exit = false
  end

  def start
    until should_exit do
      get_user_command
    end
  end

  def get_user_command
    process_user_command(gets.strip)
  end

  def process_user_command(input)
    input.downcase
    if input.empty?
      system_message(:empty_command)
    else
      if COMMANDS.has_key?(input[0])
        command(input)
      else
        system_message(:unknown_command)
      end
    end
  end

  def command(input)
    self.send(COMMANDS[input[0]], input)
  end

  private

  def system_message(type, custom = nil)
    puts custom || SYSTEM_MESSAGES[type]
  end

  def exit_editor(input)
    puts system_message(:exit_command)
    self.should_exit = true
  end

  def vertical_segment(input)
    is_valid_input(/dsfsdf/, input)
    puts system_message(nil, "Yeah dawg, hit me up with that vertical segment")
  end

  def horizontal_segment(input)
    puts system_message(nil, "Yeah dawg, hit me up with that horizontal segment")
  end

  def is_valid_input?(regex, str)

  end
end
