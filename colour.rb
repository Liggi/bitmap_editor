require_relative 'exceptions'

class Colour
  @@invalid_colour_message = "Error: invalid colour"

  def initialize(colour)
    if /[^A-Z]/.match(colour)
      raise InvalidColourException.new(colour), @@invalid_colour_message
    end

    @colour = colour
  end

  def to_s
    @colour
  end
end
