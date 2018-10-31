class OrderItem < ApplicationRecord
  validates_presence_of :count, :amount
  belongs_to :order
  belongs_to :item
end
