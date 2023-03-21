class CreateMangas < ActiveRecord::Migration[6.1]
  def change
    create_table :mangas do |t|
      t.string :title
      t.text :description
      t.integer :chapter_numbers
      t.integer :views
      t.integer :number_of_bookmarked
      t.integer :status
      t.string :categories
      t.datetime :last_update
      t.string :author

      t.timestamps
    end
  end
end
