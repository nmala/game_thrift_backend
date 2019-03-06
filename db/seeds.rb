require 'pry'
require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Game.destroy_all
# Exchange.destroy_all

# u1 = User.create(name: 'E', password: 'P', email:'e@p.com')
# u2 = User.create(name: 'sdfsdf', password: 'sdfds', email:'e@p.com')
# u3 = User.create(name: 'sdfdsfsdfg', password: 'P', email:'e@p.com')


40.times do
  User.create(name: Faker::Name.unique.name, password: rand(1000000..9999999), email: Faker::Internet.email)
end

# g1 = Game.create(name: 'GTA5', seller_id: u2.id, price: 4, # g2 = Game.create(name: 'Bugdom', seller_id: u3.id, price: 4, # g3 = Game.create(name: 'Portal', seller_id: u3.id, price: 4, # g4 = Game.create(name: 'Half Life', seller_id: u1.id, price: 4, 
# t1 = Exchange.create(buyer_id: u1.id, seller_id: g1.seller_id, game_id: g1.id)
# t1 = Exchange.create(buyer_id: u1.id, seller_id: g2.seller_id, game_id: g2.id)
# t1 = Exchange.create(buyer_id: u2.id, seller_id: g3.seller_id, game_id: g3.id)
# t1 = Exchange.create(buyer_id: u3.id, seller_id: g4.seller_id, game_id: g4.id)


# Consoles and IDs
# SNES - 19
# N64 - 4
# PS1 - 7
# DOS - 15
# Sega Genesis - 29

def fix_cover_art(url)
  split_url = url.split('thumb')
  split_url[0] += '720p'
  split_url[0].prepend('https:')
  fixed_url = split_url.join('')
end

require 'net/https'
http = Net::HTTP.new('api-v3.igdb.com', 80)

request_ps1 = Net::HTTP::Get.new(URI('https://api-v3.igdb.com/games'), {'user-key' => '3bb13b5f51ba32b2553da7cb0d920b0e'})
request_ps1.body = 'fields name, platforms.name, first_release_date, rating, summary, cover.url;
where (platforms = 7 & rating > 70) & first_release_date < 946684800;
limit 20;'
# binding.pry
JSON.parse(http.request(request_ps1).body).each do |g|
  Game.create(name: g['name'], price: rand(10..100), console: g['platforms'][0]['name'], seller: User.all.sample, description: g['summary'], release_date: g['first_release_date'], posted_date:  Time.now.to_i, image: fix_cover_art(g['cover']['url']))
end

request_n64 = Net::HTTP::Get.new(URI('https://api-v3.igdb.com/games'), {'user-key' => '3bb13b5f51ba32b2553da7cb0d920b0e'})
request_n64.body = 'fields name, platforms.name, first_release_date, rating, summary, cover.url;
where (platforms = 4 & rating > 70) & first_release_date < 946684800;
limit 20;'
JSON.parse(http.request(request_n64).body).each do |g|
  Game.create(name: g['name'], price: rand(10..100), console: g['platforms'][0]['name'], seller: User.all.sample, description: g['summary'], release_date: g['first_release_date'], posted_date:  Time.now.to_i, image: fix_cover_art(g['cover']['url']))
end

request_snes = Net::HTTP::Get.new(URI('https://api-v3.igdb.com/games'), {'user-key' => '3bb13b5f51ba32b2553da7cb0d920b0e'})
request_snes.body = 'fields name, platforms.name, first_release_date, rating, summary, cover.url;
where (platforms = 19 & rating > 70) & first_release_date < 946684800;
limit 20;'
JSON.parse(http.request(request_snes).body).each do |g|
  Game.create(name: g['name'], price: rand(10..100), console: g['platforms'][0]['name'], seller: User.all.sample, description: g['summary'], release_date: g['first_release_date'], posted_date:  Time.now.to_i, image: fix_cover_art(g['cover']['url']))
end

request_segagenesis = Net::HTTP::Get.new(URI('https://api-v3.igdb.com/games'), {'user-key' => '3bb13b5f51ba32b2553da7cb0d920b0e'})
request_segagenesis.body = 'fields name, platforms.name, first_release_date, rating, summary, cover.url;
where (platforms = 29 & rating > 70) & first_release_date < 946684800;
limit 20;'
JSON.parse(http.request(request_segagenesis).body).each do |g|
  Game.create(name: g['name'], price: rand(10..100), console: g['platforms'][0]['name'], seller: User.all.sample, description: g['summary'], release_date: g['first_release_date'], posted_date:  Time.now.to_i, image: fix_cover_art(g['cover']['url']))
end

request_dos = Net::HTTP::Get.new(URI('https://api-v3.igdb.com/games'), {'user-key' => '3bb13b5f51ba32b2553da7cb0d920b0e'})
request_dos.body = 'fields name, platforms.name, first_release_date, rating, summary, cover.url;
where (platforms = 13 & rating > 70) & first_release_date < 946684800;
limit 20;'
JSON.parse(http.request(request_dos).body).each do |g|
  Game.create(name: g['name'], price: rand(10..100), console: g['platforms'][0]['name'], seller: User.all.sample, description: g['summary'], release_date: g['first_release_date'], posted_date:  Time.now.to_i, image: fix_cover_art(g['cover']['url']))
end