class OutOfCanvasBoundsException < StandardError
  attr_reader :object

  def initialize(object)
    @object = object
  end

  def message
    "Error: attempted to paint outside the bounds of the image"
  end
end

class InvalidColourException < StandardError
  attr_reader :object

  def initialize(object)
    @object = object
  end

  def message
    "Error: invalid colour"
  end
end
