require_relative 'exceptions'

class Colour
  def initialize(colour)
    if /[^A-Z]/.match(colour)
      raise InvalidColourException.new(colour)
    end

    @colour = colour
  end

  def to_s
    @colour
  end
end
