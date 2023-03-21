class AddIsSeenToChapter < ActiveRecord::Migration[6.1]
  def change
    add_column :chapters, :is_seen, :boolean
  end
end
