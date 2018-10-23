# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

def prepare_item_1
  name = Faker::Beer.brand
  description = Faker::Beer.style
  price = Faker::Number.between(2,100)
  count = Faker::Number.between(2,100)
  thumbnail = https://food.fnr.sndimg.com/content/dam/images/food/fullset/2015/11/20/0/fnd_beer-istock.jpg.rend.hgtvcom.616.462.suffix/1448031613421.jpeg
  @item_hash_1 = {name: name, description: description, price: price, count: count, thumbnail: thumbnail}
end

def prepare_item_2
  name = Faker::Food.dish
  description = Faker::Food.description
  price = Faker::Number.between(2,100)
  inventory = Faker::Number.between(2,100)
  thumbnail = https://amp.businessinsider.com/images/5a7dc169d03072af008b4bf2-750-562.jpg
  @item_hash_2 = {name: name, description: description, price: price, count: count, thumbnail: thumbnail}
end

5.times do
  prepare_item_1
  Item.create(@item_hash_1)
end

5.times do
  prepare_item_2
  Item.create(@item_hash_2)
end


# def prepare
#   title = Faker::Book.title
#   pages = Faker::Number.between(100,1000)
#   year = Faker::Number.between(1918,2018)
#   @hash = {title: title, pages: pages, year: year}
# end
#
#
# def review_book(book)
#   title = Faker::Hipster.sentence(4)
#   body = Faker::Hipster.paragraph(2)
#   rating = Faker::Number.between(1,5)
#   new_review = book.reviews.create(title: title, body: body, rating: rating, user_id: create_user.id)
# end
