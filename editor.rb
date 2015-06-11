class BitmapEditor
  def initialize(rows, columns)
    @current_image = create_table(rows, columns)
  end

  def create_table(rows, columns, fill = "O")
    @current_image = Array.new(rows) { Array.new(columns, fill) }
  end

  def show_table
    str = ""

    @current_image.each do |r|
      str += r.map { |c| c }.join(" ") + "\n"
    end

    return str
  end

  def clear_table
    create_table(@current_image.length, @current_image[0].length)
  end

  def fill_all(c)
    create_table(@current_image.length, @current_image[0].length, c)
  end

  def paint(x, y, c)
    y = y - 1
    x = x - 1
    @current_image[y][x] = c
  end

  def paint_vertical_segment(x, y1, y2, c)
    x = x - 1
    for i in y1..y2 do
      i = i - 1
      @current_image[i][x] = c
    end
  end

  def paint_horizontal_segment(x1, x2, y, c)
    y = y - 1
    for i in x1..x2 do
      i = i - 1
      @current_image[y][i] = c
    end
  end

  def paint_square(p1, p2, c)
    startColumn = p1[0]
    endColumn = p2[0]
    startRow = p1[1]
    endRow = p2[1]

    for i in startColumn..endColumn do
      paint_vertical_segment(i, startRow, endRow, c)
    end
  end

  def fill_region(x, y, c, o = nil)
    continue = true

    if(o == nil)
      # First run
      x = x - 1
      y = y - 1

      o = @current_image[y][x]
      @current_image[y][x] = c
    else
      # Subsequent recursive runs
      if @current_image[y][x] == o
        @current_image[y][x] = c
      else
        continue = false
      end
    end

    if continue
      if(y + 1 < @current_image.length)
        fill_region(x, y + 1, c, o)
      end

      if(y - 1 >= 0)
        fill_region(x, y - 1, c, o)
      end


      if(x + 1 < @current_image.length)
        fill_region(x + 1, y, c, o)
      end

      if(x - 1 >= 0)
        fill_region(x - 1, y, c, o)
      end
    end
  end
end
