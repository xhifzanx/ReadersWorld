class RemoveMangasIdFromChapter < ActiveRecord::Migration[6.1]
  def change
    remove_column :chapters, :mangas_id, :integer
  end
end
