class AddMangaIdToChapter < ActiveRecord::Migration[6.1]
  def change
    add_column :chapters, :manga_id, :integer
  end
end
