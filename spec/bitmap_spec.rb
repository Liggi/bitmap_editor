require_relative '../editor'

RSpec.describe BitmapEditor, "#create" do
  context "a basic 4x4 image" do
    it "returns an appropriate string" do
      editor = BitmapEditor.new(4, 4)
      expect(editor.show_table).to eq "O O O O\nO O O O\nO O O O\nO O O O\n"
    end
  end
  context "a basic 6x3 image" do
    it "returns an appropriate string" do
      editor = BitmapEditor.new(3, 6)
      expect(editor.show_table).to eq "O O O O O O\nO O O O O O\nO O O O O O\n"
    end
  end
end

RSpec.describe BitmapEditor, "#paint" do
  context "paint a point" do
    it "changes the colour of the specified point" do
      editor = BitmapEditor.new(4, 4)
      editor.paint(2, 3, "T")
      expect(editor.show_table).to eq "O O O O\nO O O O\nO T O O\nO O O O\n"
    end
  end
  context "paint multiple points" do
    it "changes the colour of the specified points" do
      editor = BitmapEditor.new(4, 4)
      editor.paint(2, 3, "T")
      editor.paint(1, 1, "D")
      expect(editor.show_table).to eq "D O O O\nO O O O\nO T O O\nO O O O\n"
    end
  end
  context "fill the entire square" do
    it "changes the colour of the entire image to the specified colour" do
      editor = BitmapEditor.new(6, 6)
      editor.fill_all("C")
      expect(editor.show_table).to eq "C C C C C C\nC C C C C C\nC C C C C C\nC C C C C C\nC C C C C C\nC C C C C C\n"
    end
  end
  context "paint a horizontal segment" do
    it "changes the colour of the specified segment" do
      editor = BitmapEditor.new(5, 5)
      editor.paint_horizontal_segment(2, 4, 3, "T")
      expect(editor.show_table).to eq "O O O O O\nO O O O O\nO T T T O\nO O O O O\nO O O O O\n"
    end
  end
  context "paint a vertical segment" do
    it "changes the colour of the specified segment" do
      editor = BitmapEditor.new(5, 5)
      editor.paint_vertical_segment(4, 1, 4, "T")
      expect(editor.show_table).to eq "O O O T O\nO O O T O\nO O O T O\nO O O T O\nO O O O O\n"
    end
  end
  context "paint a square" do
    it "creates a coloured square with the appropriate top-left and bottom-right coordinates" do
      editor = BitmapEditor.new(6, 6)
      editor.paint_square([2, 2], [5, 5], "T")
      expect(editor.show_table).to eq "O O O O O O\nO T T T T O\nO T T T T O\nO T T T T O\nO T T T T O\nO O O O O O\n"
    end
  end
  context "fill a region" do
    it "creates a square, splits it with a vertical segment and then fills the left side with a specified colour" do
      editor = BitmapEditor.new(10, 10)
      editor.paint_square([3, 3], [8, 8], "T")
      editor.paint_vertical_segment(5, 1, 10, "C")
      editor.fill_region(4, 4, "D")
      expect(editor.show_table).to eq "O O O O C O O O O O\nO O O O C O O O O O\nO O D D C T T T O O\nO O D D C T T T O O\nO O D D C T T T O O\nO O D D C T T T O O\nO O D D C T T T O O\nO O D D C T T T O O\nO O O O C O O O O O\nO O O O C O O O O O\n"
    end
  end
end
