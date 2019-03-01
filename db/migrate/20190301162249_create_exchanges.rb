class CreateExchanges < ActiveRecord::Migration[5.2]
  def change
    create_table :exchanges do |t|
      t.integer :buyer_id
      t.integer :seller_id
      t.integer :game_id

      t.timestamps
    end
  end
end
