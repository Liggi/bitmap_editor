require_relative '../editor'

RSpec.describe BitmapEditor, "#create" do
  context "a basic 4x4 image" do
    it "returns an appropriate string" do
      editor = BitmapEditor.new(4, 4)
      expect(editor.show_table).to eq "O O O O\nO O O O\nO O O O\nO O O O\n"
    end
  end
end
