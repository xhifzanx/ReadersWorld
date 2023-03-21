class AddNumberOfBookmarksToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :number_of_bookmarks, :integer
  end
end
