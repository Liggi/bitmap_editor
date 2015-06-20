require_relative 'canvas'
require_relative 'colour'
require_relative 'point'

class Editor
  def initialize(canvas)
    @canvas = canvas
  end

  def pencil(point, colour)
    @canvas.update(point, colour)
  end

  def shape(startPoint, endPoint, colour)
    Range.new(startPoint.x, endPoint.x).each do |x|
      Range.new(startPoint.y, endPoint.y).each do |y|
        @canvas.update(Point.new(x, y), colour)
      end
    end
  end

  def fill(point, colour, previousColour = nil)
    if(previousColour)
      puts "subsequent"
      if @canvas.get_point_colour(point) == previousColour
        puts "updating point " + point.x.to_s + "," + point.y.to_s
        gets
        @canvas.update(point, colour)
        if @canvas.get_point_colour(point) != colour
          puts "didn't set properly"
        end
        fill_adjacent(point, colour, previousColour)
      end
    else
      previousColour = @canvas.get_point_colour(point)
      puts "updating point " + point.x.to_s + "," + point.y.to_s
      gets
      @canvas.update(point, colour)
      if @canvas.get_point_colour(point) != colour
        puts "didn't set properly"
      end
      fill_adjacent(point, colour, previousColour)
    end
  end

  def fill_adjacent(point, colour, previousColour)
    @canvas.get_adjacent_points(point).each do |p|
      fill(p, colour, previousColour)
    end
  end

  private :fill_adjacent
end
