class AddPostedDateToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :posted_date, :datetime
  end
end
