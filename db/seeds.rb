# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.destroy_all
# Game.destroy_all
# Exchange.destroy_all


# u1 = User.create(name: 'E', password: 'P', email:'e@p.com')
# u2 = User.create(name: 'sdfsdf', password: 'sdfds', email:'e@p.com')
# u3 = User.create(name: 'sdfdsfsdfg', password: 'P', email:'e@p.com')

# g1 = Game.create(name: 'GTA5', seller_id: u2.id, price: 4, is_game: true)
# g2 = Game.create(name: 'Bugdom', seller_id: u3.id, price: 4, is_game: true)
# g3 = Game.create(name: 'Portal', seller_id: u3.id, price: 4, is_game: true)
# g4 = Game.create(name: 'Half Life', seller_id: u1.id, price: 4, is_game: true)

# t1 = Exchange.create(buyer_id: u1.id, seller_id: g1.seller_id, game_id: g1.id)
# t1 = Exchange.create(buyer_id: u1.id, seller_id: g2.seller_id, game_id: g2.id)
# t1 = Exchange.create(buyer_id: u2.id, seller_id: g3.seller_id, game_id: g3.id)
# t1 = Exchange.create(buyer_id: u3.id, seller_id: g4.seller_id, game_id: g4.id)

# require 'net/https'
# http = Net::HTTP.new('api-v3.igdb.com', 80)
# request = Net::HTTP::Get.new(URI('https://api-v3.igdb.com/games'), {'user-key' => '3bb13b5f51ba32b2553da7cb0d920b0e'})
# request.body = 'search "zelda"; fields platforms;'

# puts http.request(request).body

require 'net/https'
http = Net::HTTP.new('api-v3.igdb.com', 80)
request = Net::HTTP::Get.new(URI('https://api-v3.igdb.com/games'), {'user-key' => '3bb13b5f51ba32b2553da7cb0d920b0e'})
request.body = 'fields *; where platforms = 4; limit 1;'
puts http.request(request).body