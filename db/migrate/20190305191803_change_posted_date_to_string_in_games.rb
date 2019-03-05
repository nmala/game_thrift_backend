class ChangePostedDateToStringInGames < ActiveRecord::Migration[5.2]
  def change
    change_column :games, :posted_date, :string
  end
end
