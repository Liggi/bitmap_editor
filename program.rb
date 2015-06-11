require_relative 'editor'

$editor = BitmapEditor.new(4, 4)
$current_image_height = 4
$current_image_width = 4

def print_system_message(message)
  puts "---------------"
  puts message
  puts "---------------"
end

def intro
  print_system_message "Hi, and welcome to my Bitmap Editor!\n\nIf you get a little stuck, just type 'j' for 'help'."
end

def help
  puts "---------------"
  puts "You have a number of commands in this editor:\n\n"
  puts "X: Quit"
  puts "I: in the form of 'I 20 20', creates a 20x20 image"
  puts "S: Show image"
  puts "L: in the form of 'L 2 5 C', paints the pixel at column 2, row 5 with a C colour"
  puts "H: in the form of 'H 1 5 2 C', paints a horizontal segment, starting at column 1, ending at column 5, on row 2 with a C colour"
  puts "V: in the form of 'V 1 2 5 C', paints a vertical segment, starting at row 2, ending at row 5, on column 1 with a C colour"
  puts "F: in the form of 'F 2 3 C', performs a fill starting at column 2, row 3, filling that point and all adjacent points with a C colour"
  puts "A: in the form of 'A C', performs an entire image fill with the colour C"
  puts "Q: in the form of 'Q 2 2 4 4', paints a square with the top left at column 2, row 2, and the bottom right at column 4, row 4 with a C colour"
  puts "---------------"
end

def create_new_image(args)
  unless ((Integer(args[1]) rescue false) && (Integer(args[2]) rescue false))
    print_system_message "Incorrect arguments passed for this command. Type 'j' for help."
  else
    columns = args[1].to_i
    rows = args[2].to_i

    if(rows > 250)
      print_system_message "Maximum image height is 250, so the height for your new image has been set to 250"
      rows = 250
    end

    if(columns > 250)
      print_system_message "Maximum image width is 250, so the width for your new image has been set to 250"
      columns = 250
    end

    $editor.create_table(columns, rows)
    $current_image_height = rows
    $current_image_width = columns
  end
end

def paint(args, type)
  case type
  when :point
    paint_point(args)
  when :vertical
    paint_vertical(args)
  when :horizontal
    paint_horizontal(args)
  when :fill
    paint_fill(args)
  end
end

def paint_vertical(args)
  if(valid_segment_arguments(args))
    column = args[1].to_i
    rowStart = args[2].to_i
    rowEnd = args[3].to_i

    if(column > $current_image_width || rowStart > $current_image_height || rowEnd > $current_image_height)
      print_system_message "You're trying to paint outside the bounds of the image! Double check your arguments."
    else
      $editor.paint_vertical_segment(column, rowStart, rowEnd, args[4])
    end
  end
end

def paint_horizontal(args)
  if(valid_segment_arguments(args))
    columnStart = args[1].to_i
    columnEnd = args[2].to_i
    row = args[3].to_i

    if(columnStart > $current_image_width || columnEnd > $current_image_width || row > $current_image_height)
      print_system_message "You're trying to paint outside the bounds of the image! Double check your arguments."
    else
      $editor.paint_horizontal_segment(columnStart, columnEnd, row, args[4])
    end
  end
end

def paint_fill(args)
  if(valid_point_arguments(args))
    row = args[1].to_i
    column = args[2].to_i

    if(row > $current_image_height || column > $current_image_width)
      print_system_message "You're trying to paint outside the bounds of the image! Double check your arguments."
    else
      $editor.fill_region(row, column, args[3])
    end
  end
end

def paint_point(args)
  if(valid_point_arguments(args))
    row = args[1].to_i
    column = args[2].to_i

    if(row > $current_image_height || column > $current_image_width)
      print_system_message "You're trying to paint outside the bounds of the image! Double check your arguments."
    else
      $editor.paint(row, column, args[3])
    end
  end
end

def paint_square(args)
  if(valid_square_arguments(args))
    topLeftX = args[1].to_i
    topLeftY = args[2].to_i
    bottomRightX = args[3].to_i
    bottomRightY = args[4].to_i

    if(topLeftX > $current_image_width || bottomRightX > $current_image_width || topLeftY > $current_image_height || bottomRightY > $current_image_height)
      print_system_message "You're trying to paint outside the bounds of the image! Double check your arguments."
    else
      $editor.paint_square([topLeftX, topLeftY], [bottomRightX, bottomRightY], args[5])
    end
  end

end

def fill_all(args)
  if(args[1].length == 1)
    $editor.fill_all(args[1])
  end
end

def valid_point_arguments(args)
  unless ((Integer(args[1]) rescue false) && (Integer(args[2]) rescue false) && (args[3].length == 1))
    print_system_message "Incorrect arguments passed for this command. Type 'j' for help."
    return false
  else
    return true
  end
end

def valid_segment_arguments(args)
  unless ((Integer(args[1]) rescue false) && (Integer(args[2]) rescue false) && (Integer(args[3]) rescue false) && (args[4].length == 1))
    print_system_message "Incorrect arguments passed for this command. Type 'j' for help."
    return false
  else
    return true
  end
end

def valid_square_arguments(args)
  unless ((Integer(args[1]) rescue false) && (Integer(args[2]) rescue false) && (Integer(args[3]) rescue false) && (Integer(args[4]) rescue false)&& (args[5].length == 1))
    print_system_message "Incorrect arguments passed for this command. Type 'j' for help."
    return false
  else
    return true
  end
end

def main
  intro()

  exit = false

  while(!exit)
    print "> "

    input = gets.chomp
    command = input[0].upcase
    args = input.split(" ")

    case command
    when "I"
      create_new_image(args)
    when "S"
      puts $editor.show_table
    when "X"
      exit = true
      print_system_message "Have a nice day!"
    when "L"
      paint(args, :point)
    when "V"
      paint(args, :vertical)
    when "H"
      paint(args, :horizontal)
    when "F"
      paint(args, :fill)
    when "C"
      $editor.clear_table
    when "A"
      fill_all(args)
    when "Q"
      paint_square(args)
    when "J"
      help
    else
      print_system_message "Command not recognised.\nNeed help? Type 'j' for help."
    end
  end
end

main()
