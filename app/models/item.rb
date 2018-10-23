class Item < ApplicationRecord
  validates_presence_of :name

  has_many :cart_items
  has_many :carts, through: :cart_items
end
