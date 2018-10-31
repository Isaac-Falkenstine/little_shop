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
  inventory = Faker::Number.between(10,100)
  thumbnail = "https://food.fnr.sndimg.com/content/dam/images/food/fullset/2015/11/20/0/fnd_beer-istock.jpg.rend.hgtvcom.616.462.suffix/1448031613421.jpeg"
  @item_hash_1 = {name: name, description: description, price: price, inventory: inventory, thumbnail: thumbnail}
end

def prepare_item_2
  name = Faker::Food.dish
  description = Faker::Food.description
  price = Faker::Number.between(2,100)
  inventory = Faker::Number.between(10,100)
  thumbnail = "https://amp.businessinsider.com/images/5a7dc169d03072af008b4bf2-750-562.jpg"
  @item_hash_2 = {name: name, description: description, price: price, inventory: inventory, thumbnail: thumbnail}
end

admin = User.create(
  first_name: "admin",
  last_name: "user",
  street_address: "123 street",
  city: "Denver",
  state: "CO",
  zip: 80000,
  password: "pass123",
  email_address: "admin@email.com",
  role: 2
)
user_1 = User.create(
  first_name: "Merchant",
  last_name: "Of Beer",
  street_address: "123 Paradise Way",
  city: "Jonestown",
  state: "PA",
  zip: 66667,
  password: "pass123",
  email_address: "merchant1@email.com",
  role: 1
)
user_2 = User.create(
  first_name: "Jefferey",
  last_name: "Dahmer",
  street_address: "321 Main Street",
  city: "Milwaukee",
  state: "WI",
  zip: 54122,
  password: "pass123",
  email_address: "regular@email.com"
)
user_3 = User.create(
  first_name: "Ted",
  last_name: "Bundy",
  street_address: "776 Example Ave",
  city: "Chicago",
  state: "IL",
  zip: 66754,
  password: "qwerty123",
  email_address: "must_love_dogs@example.com"
)
user_4 = User.create(
  first_name: "Edward",
  last_name: "Gein",
  street_address: "555 Murphy Road",
  city: "Plainsville",
  state: "WI",
  zip: 54321,
  password: "qdawg45",
  email_address: "a_boys_best_friend@example.com"
)
user_5 = User.create(
  first_name: "Charles",
  last_name: "Manson",
  street_address: "765 Hollywood blvd",
  city: "Hollywood",
  state: "CA",
  zip: 78901,
  password: "password65",
  email_address: "helter_skelter@example.com"
)
user_6 = User.create(
  first_name: "Felicity",
  last_name: "Huffman",
  street_address: "12 Not-the Way",
  city: "Pleasantville",
  state: "WA",
  zip: 68927,
  password: "password34",
  email_address: "ruffnbuff@example.com",
)
user_7 = User.create(
  first_name: "Sally",
  last_name: "Field",
  street_address: "6612 Purpose Street",
  city: "Reno",
  state: "NV",
  zip: 76542,
  password: "password99",
  email_address: "applepie@example.com",
)
user_8 = User.create(
  first_name: "Bette",
  last_name: "White",
  street_address: "767 Main St",
  city: "Santa Fe",
  state: "NM",
  zip: 98537,
  password: "qwer67",
  email_address: "cute_for_you@example.com",
)
user_9 = User.create(
  first_name: "Jennifer",
  last_name: "Lawerence",
  street_address: "5785 Candle blvd",
  city: "Augusta",
  state: "MO",
  zip: 76678,
  password: "jlaw98",
  email_address: "livin_loca889@example.com",
)
user_10 = User.create(
  first_name: "Margeret",
  last_name: "Thatcher",
  street_address: "8896 Dev ave.",
  city: "New York",
  state: "NY",
  zip: 99876,
  password: "password99",
  email_address: "dream_gal@example.com",
)

user_11 = User.create(
  first_name: "Merchant",
  last_name: "Of Food",
  street_address: "123 Paradise Way",
  city: "Jonestown",
  state: "PA",
  zip: 66667,
  password: "pass123",
  email_address: "merchant@email.com",
  role: 1
)

  prepare_item_1
  item_1 = user_1.items.create(@item_hash_1)

  prepare_item_1
  item_2 = user_1.items.create(@item_hash_1)

  prepare_item_1
  item_3 = user_1.items.create(@item_hash_1)

  prepare_item_1
  item_4 = user_1.items.create(@item_hash_1)

  prepare_item_1
  item_5 = user_1.items.create(@item_hash_1)

  prepare_item_1
  item_6 = user_1.items.create(@item_hash_1)

  prepare_item_1
  item_7 = user_1.items.create(@item_hash_1)

  prepare_item_1
  item_8 = user_1.items.create(@item_hash_1)


  prepare_item_2
  item_9 = user_11.items.create(@item_hash_2)

  prepare_item_2
  item_10 = user_11.items.create(@item_hash_2)

  prepare_item_2
  item_11 = user_11.items.create(@item_hash_2)

  prepare_item_2
  item_12 = user_11.items.create(@item_hash_2)

  prepare_item_2
  item_13 = user_11.items.create(@item_hash_2)

  prepare_item_2
  item_14 = user_11.items.create(@item_hash_2)

  prepare_item_2
  item_15 = user_11.items.create(@item_hash_2)

  prepare_item_2
  item_16 = user_11.items.create(@item_hash_2)


order_1 = user_1.orders.create(status: :complete)
order_2 = user_1.orders.create(status: :complete)
order_3 = user_2.orders.create(status: :pending)
order_4 = user_2.orders.create(status: :complete)
order_5 = user_3.orders.create(status: :complete)

OrderItem.create(
  item_id: item_1.id,
  order_id: order_1.id,
  count: 5,
  amount: item_1.price
)
OrderItem.create(
  item_id: item_1.id,
  order_id: order_1.id,
  count: 1,
  amount: item_4.price
)
OrderItem.create(
  item_id: item_2.id,
  order_id: order_2.id,
  count: 7,
  amount: item_2.price
)
OrderItem.create(
  item_id: item_3.id,
  order_id: order_2.id,
  count: 2,
  amount: item_3.price
)
OrderItem.create(
  item_id: item_4.id,
  order_id: order_3.id,
  count: 6,
  amount: item_5.price
)
OrderItem.create(
  item_id: item_5.id,
  order_id: order_4.id,
  count: 2,
  amount: item_5.price
)
OrderItem.create(
  item_id: item_6.id,
  order_id: order_5.id,
  count: 8,
  amount: item_4.price
)

OrderItem.create(
  item_id: item_7.id,
  order_id: order_1.id,
  count: 5,
  amount: item_1.price
)
OrderItem.create(
  item_id: item_8.id,
  order_id: order_1.id,
  count: 4,
  amount: item_4.price
)
OrderItem.create(
  item_id: item_9.id,
  order_id: order_2.id,
  count: 7,
  amount: item_2.price
)
OrderItem.create(
  item_id: item_10.id,
  order_id: order_2.id,
  count: 7,
  amount: item_3.price
)
OrderItem.create(
  item_id: item_11.id,
  order_id: order_3.id,
  count: 10,
  amount: item_5.price
)
OrderItem.create(
  item_id: item_12.id,
  order_id: order_4.id,
  count: 8,
  amount: item_5.price
)
OrderItem.create(
  item_id: item_13.id,
  order_id: order_5.id,
  count: 2,
  amount: item_4.price
)
OrderItem.create(
  item_id: item_12.id,
  order_id: order_4.id,
  count: 2,
  amount: item_5.price
)
OrderItem.create(
  item_id: item_13.id,
  order_id: order_5.id,
  count: 8,
  amount: item_4.price
)
