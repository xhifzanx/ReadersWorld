class AddBookmarkedToManga < ActiveRecord::Migration[6.1]
  def change
    add_column :mangas, :bookmarked, :boolean
  end
end
