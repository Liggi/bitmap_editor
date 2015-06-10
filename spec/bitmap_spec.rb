require_relative '../editor'

RSpec.describe BitmapEditor, "#create" do
  context "a basic 1x4 image" do
    it "returns an appropriate string" do
      editor = BitmapEditor.new(1, 4)
      expect(editor.show_table).to eq "O O O O"
    end
  end
end
