class CommandBase
  attr_reader :input

  def initialize(input)
    @input = input
  end

  private

  def actual_input
    input.split(' ').drop 1
  end
end
