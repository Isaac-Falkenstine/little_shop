class Order < ApplicationRecord
  validates_presence_of :total, :status

  has_many :order_items
  has_many :items, through: :order_items
  belongs_to :user

  enum status: [:pending, :cancelled, :complete]
end
