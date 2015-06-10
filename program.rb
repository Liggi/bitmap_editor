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
  print_system_message "Hi, and welcome to my Bitmap Editor!\n\nIf you get a little stuck, just type 'h' for 'help'."
end

def help
  puts "---------------"
  puts "You have a number of commands in this editor:\n\n"
  puts "X: Quit"
  puts "I: in the form of 'I 20 20', creates a 20x20 image"
  puts "S: Show image"
  puts "L: in the form of 'L 2 5 C', paints the pixel at column 2, row 5 with a C colour"
  puts "---------------"
end

def create_new_image(args)
  begin
    columns = args[1].to_i
    rows = args[2].to_i
  rescue ArgumentError => e
    print_system_message "Invalid arguments supplied! Make sure you are providing integers"
  end

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
      $editor.paint(args[1].to_i, args[2].to_i, args[3])
    when "H"
      help
    else
      print_system_message "Command not recognised.\nNeed help? Type 'h' for help."
    end
  end
end

main()
