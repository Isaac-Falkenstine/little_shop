class Item < ApplicationRecord
  validates_presence_of :name, :thumbnail, :price, :inventory, :description

  has_many :order_items
  has_many :orders, through: :order_items

  def disable_item
    deadtome = Item.find(id)
    deadtome.enabled = false
    deadtome.save
  end

  def enable_item
    lazurus = Item.find(id)
    lazurus.enabled = true
    lazurus.save
  end

  def find_merchant_for_item
    merchant = User.where(id: self.user_id).first
    "#{merchant.first_name} #{merchant.last_name}"
  end

end
