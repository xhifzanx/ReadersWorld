class CreateMangaUserJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_join_table :mangas, :users do |t|
      t.index [:manga_id, :user_id]
      t.index [:user_id, :manga_id]
    end
  end
end
