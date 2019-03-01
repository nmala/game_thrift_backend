class GameSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :price, :image, :console, :is_game

  belongs_to :user
  has_one :exchange
end
