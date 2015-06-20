class OutOfCanvasBoundsException < StandardError
  attr_reader :object

  def initialize(object)
    @object = object
  end
end

class InvalidColourException < StandardError
  attr_reader :object

  def initialize(object)
    @object = object
  end
end
