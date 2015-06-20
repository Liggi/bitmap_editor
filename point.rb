class Point
  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end
  
  def to_s
    @x.to_s + ", " + @y.to_s
  end
end
