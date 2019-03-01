class RemoveUserIdfromGame < ActiveRecord::Migration[5.2]
  def change
    remove_column :games, :user_id
    add_column :games, :seller_id, :integer
  end
end
