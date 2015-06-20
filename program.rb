require_relative 'exceptions'
require_relative 'editor'
require_relative 'canvas'

canvas = Canvas.new(6, 6)
editor = Editor.new(canvas)

#editor.pencil(Point.new(2, 2), Colour.new("T"))

editor.fill(Point.new(2, 2), Colour.new("D"))
