# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

def prepare_item_1
  name = Faker::Beer.name
  description = Faker::Beer.style
  price = Faker::Number.between(2,100)
  inventory = Faker::Number.between(2,100)
  thumbnail = "https://food.fnr.sndimg.com/content/dam/images/food/fullset/2015/11/20/0/fnd_beer-istock.jpg.rend.hgtvcom.616.462.suffix/1448031613421.jpeg"
  @item_hash_1 = {name: name, description: description, price: price, inventory: inventory, thumbnail: thumbnail}
end

def prepare_item_2
  name = Faker::Food.dish
  description = Faker::Food.description
  price = Faker::Number.between(2,100)
  inventory = Faker::Number.between(2,100)
  thumbnail = "https://amp.businessinsider.com/images/5a7dc169d03072af008b4bf2-750-562.jpg"
  @item_hash_2 = {name: name, description: description, price: price, inventory: inventory, thumbnail: thumbnail}
end

reg_user = User.create(first_name: "Regular", last_name: "User", street_address: "1234 Normal St.",
                       city: "Lone Tree", state: "Colorado", zip: 81234, email_address: "regular@email.com", password: "pass123")

merch_user = User.create(first_name: "Merchant of beer", last_name: "User", street_address: "1234 Sales St.",
                      city: "Lone Tree", state: "Colorado", zip: 81234, email_address: "merchant@email.com", password: "pass123", role: 1)

merch_user_2 = User.create(first_name: "Merchant of food", last_name: "User", street_address: "1234 Sales St.",
                      city: "Lone Tree", state: "Colorado", zip: 81234, email_address: "merchant1@email.com", password: "pass123", role: 1)

admin_user = User.create(first_name: "Admin", last_name: "User", street_address: "1234 Boss St.",
                       city: "Lone Tree", state: "Colorado", zip: 81234, email_address: "admin@email.com", password: "pass123", role: 2)

num = 8

num.times do
 prepare_item_1
 merch_user.items.create(@item_hash_1)
end
p "Created #{num} beers"

num.times do
 prepare_item_2
 merch_user_2.items.create(@item_hash_2)
end
p "Created #{num} foods"
