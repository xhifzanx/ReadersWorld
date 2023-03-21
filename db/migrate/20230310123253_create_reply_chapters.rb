class CreateReplyChapters < ActiveRecord::Migration[6.1]
  def change
    create_table :reply_chapters do |t|
      t.text :reply_message
      t.references :comment_chapter, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
