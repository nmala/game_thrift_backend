class User < ApplicationRecord
  has_many :exchanges, foreign_key: :seller_id, class_name: 'Exchange', :dependent => :destroy
  has_many :exchanges, foreign_key: :buyer_id, class_name: 'Exchange', :dependent => :destroy

  has_many :sellers, through: :exchanges, source: :seller, :dependent => :destroy
  has_many :buyers, through: :exchanges, source: :buyer, :dependent => :destroy
  
  has_many :games, foreign_key: :seller_id, class_name: 'Game', :dependent => :destroy
end
