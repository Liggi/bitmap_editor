require_relative 'exceptions'
require_relative 'commands'
require_relative 'editor'
require_relative 'canvas'

class UI
  def start
    loop { process_input }
  end

  def process_input
    Commands.for(gets.strip.downcase).call
  end

  private

  def editor
    @editor ||= Editor.new(
      Canvas.new(6, 6)
    )
  end
end
