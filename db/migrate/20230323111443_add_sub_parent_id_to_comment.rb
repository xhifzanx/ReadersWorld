class AddSubParentIdToComment < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :sub_parent_id, :integer
  end
end
