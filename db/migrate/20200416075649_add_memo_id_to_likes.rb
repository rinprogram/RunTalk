class AddMemoIdToLikes < ActiveRecord::Migration[5.2]
  def change
    add_column :likes,:memo_id,:integer
  end
end
