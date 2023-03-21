class RemoveImagesFromChapter < ActiveRecord::Migration[6.1]
  def change
    remove_column :chapters, :images, :string
  end
end
