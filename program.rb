require_relative 'editor'

def print_system_message(message)
  puts "---------------"
  puts message
  puts "---------------"
end

editor = BitmapEditor.new(4, 4)
exit = false

print_system_message "Hi, and welcome to my Bitmap Editor!"

while(!exit)
  print "> "
  command = gets.chomp.downcase

  if(command == "s")
    puts editor.show_table
  end

  if(command == "x")
    exit = true
    print_system_message "Have a nice day!"
  end
end
