class Cart < ApplicationRecord
  validates_presence_of :item
  
  has_many :cart_items
  has_many :items, through: :cart_items
end