require_relative 'exceptions'
require_relative 'point'

class Canvas
  attr_reader :width, :height

  @@out_of_bounds_message = "Error: attempted to paint outside the bounds of the image"

  def initialize(width, height)
    @matrix = create(width, height)
    @width = width
    @height = height
  end

  def create(width, height, defaultFill = "O")
    @matrix = Array.new(height) { Array.new(width, defaultFill) }
  end

  def update(point, colour)
    if is_point_within_bounds?(point)
      @matrix[point.y - 1][point.x - 1] = colour
    else
      raise OutOfImageBoundsException.new(point), @@out_of_bounds_message
    end
  end

  def get_point_colour(point)
    @matrix[point.y - 1][point.x - 1]
  end

  def get_adjacent_points(point)
    points = Array.new
    [
      Point.new(point.x - 1, point.y),
      Point.new(point.x + 1, point.y),
      Point.new(point.x, point.y - 1),
      Point.new(point.x, point.y + 1)
    ].each do |p|
      if is_point_within_bounds?(p)
        points.push(p)
      end
    end
    points
  end

  def is_point_within_bounds?(point)
    point.x.between?(1, @width) && point.y.between?(1, @height)
  end

  def to_s
    @matrix.map { |r| r.join(" ") + "\n" }
  end

  private :create
end
