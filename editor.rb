class BitmapEditor
  def initialize(rows, columns)
    @current_image = create_table(rows, columns)
  end

  def create_table(rows, columns)
    Array.new(rows) { Array.new(columns, "O") }
  end

  def show_table
    str = ""

    @current_image.each do |r|
      str += r.map { |c| c }.join(" ")
    end

    return str
  end

  def clear_table
    create_table($table.length, $table[0].length)
  end

  def paint(x, y, c)
    y = y - 1
    x = x - 1
    $table[y][x] = c
  end

  def paint_vertical_segment(x, y1, y2, c)
    x = x - 1
    for i in y1..y2 do
      i = i - 1
      $table[i][x] = c
    end
  end

  def paint_horizontal_segment(x1, x2, y, c)
    y = y - 1
    for i in x1..x2 do
      i = i - 1
      $table[y][i] = c
    end
  end

  def fill_region(x, y, c, o = nil)
    continue = true

    if(o == nil)
      # First run
      x = x - 1
      y = y - 1

      o = $table[y][x]
      $table[y][x] = c
    else
      # Subsequent recursive runs
      if $table[y][x] == o
        $table[y][x] = c
      else
        continue = false
      end
    end

    if continue
      if(y + 1 < $table.length)
        fill_region(x, y + 1, c, o)
      end

      if(y - 1 >= 0)
        fill_region(x, y - 1, c, o)
      end


      if(x + 1 < $table[0].length)
        fill_region(x + 1, y, c, o)
      end

      if(x - 1 >= 0)
        fill_region(x - 1, y, c, o)
      end
    end
  end
end
