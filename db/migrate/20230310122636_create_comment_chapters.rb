class CreateCommentChapters < ActiveRecord::Migration[6.1]
  def change
    create_table :comment_chapters do |t|
      t.text :message
      t.references :chapter, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
