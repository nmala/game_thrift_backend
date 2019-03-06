class RemoveIsTrueColumnFromGames < ActiveRecord::Migration[5.2]
  def change
    remove_column :games, :is_game
  end
end
