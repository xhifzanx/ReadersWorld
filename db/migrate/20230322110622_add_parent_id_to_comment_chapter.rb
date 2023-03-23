class AddParentIdToCommentChapter < ActiveRecord::Migration[6.1]
  def change
    add_column :comment_chapters, :parent_id, :integer
  end
end
