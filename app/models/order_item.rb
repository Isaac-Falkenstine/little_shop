class OrderItem < ApplicationRecord
  validates_presence_of :count
  belongs_to :order
  belongs_to :item
end
#add relation of order_id, item_id