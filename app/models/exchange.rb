class Exchange < ApplicationRecord
  belongs_to :seller, foreign_key: 'seller_id', class_name: 'User'
  belongs_to :buyer, foreign_key: 'buyer_id', class_name: 'User'
  belongs_to :game
end
