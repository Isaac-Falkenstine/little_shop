class OrderItem < ApplicationRecord
  validates_presence_of :count, :subtotal
  belongs_to :user
  belongs_to :order
  belongs_to :item
end
