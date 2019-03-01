class GameSerializer < ActiveModel::Serializer
  attributes :id, :seller_id, :price, :image, :console, :is_game

  belongs_to :seller
  has_one :exchange
end
