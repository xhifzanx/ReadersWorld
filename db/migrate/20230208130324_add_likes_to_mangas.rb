class AddLikesToMangas < ActiveRecord::Migration[6.1]
  def change
    add_column :mangas, :likes, :integer
  end
end
