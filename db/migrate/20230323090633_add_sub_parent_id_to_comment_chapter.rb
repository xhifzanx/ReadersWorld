class AddSubParentIdToCommentChapter < ActiveRecord::Migration[6.1]
  def change
    add_column :comment_chapters, :sub_parent_id, :integer
  end
end
