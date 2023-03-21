class AddThumbnailToManga < ActiveRecord::Migration[6.1]
  def change
    add_column :mangas, :thumbnail, :string
  end
end
