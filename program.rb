require_relative 'exceptions'
require_relative 'editor'
require_relative 'canvas'

canvas = Canvas.new(6, 6)
editor = Editor.new(canvas)

editor.shape(Point.new(2, 2), Point.new(5, 5), Colour.new("B"))

puts canvas.to_s
puts ""

editor.shape(Point.new(2, 3), Point.new(6, 3), Colour.new("A"))

puts canvas.to_s
puts ""

editor.pencil(Point.new(2, 2), Colour.new("T"))

puts canvas.to_s
puts ""

editor.fill(Point.new(3, 2), Colour.new("D"))

puts canvas.to_s
puts ""
