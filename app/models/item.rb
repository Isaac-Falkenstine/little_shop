class Item < ApplicationRecord
  validates_presence_of :name, :thumbnail, :price, :inventory, :description

  validates :price, presence: true, :numericality => { greater_than: 0}
  validates :inventory, presence: true, :numericality => { greater_than_or_equal_to: 0}

  belongs_to :user
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
end
