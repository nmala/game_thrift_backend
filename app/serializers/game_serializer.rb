class GameSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :release_date, :posted_date, :seller_id, :price, :image, :console
  
  belongs_to :seller
  has_one :exchange
end
