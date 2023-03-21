class CreateChapters < ActiveRecord::Migration[6.1]
  def change
    create_table :chapters do |t|
      t.string :images
      t.string :title
      t.references :mangas, null: false, foreign_key: true

      t.timestamps
    end
  end
end
