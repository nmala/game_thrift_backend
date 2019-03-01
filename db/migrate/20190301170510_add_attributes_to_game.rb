class AddAttributesToGame < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :price, :integer
    add_column :games, :image, :string
    add_column :games, :console, :string
    add_column :games, :is_game, :boolean
  end
end
