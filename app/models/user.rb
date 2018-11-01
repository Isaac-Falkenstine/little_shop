class User < ApplicationRecord
  validates_presence_of :first_name, :last_name, :street_address, :city, :state, :zip
  validates_presence_of :password, require: true, on: :create
  validates :email_address, presence: true, uniqueness: true

  has_many :orders
  has_many :items


  has_secure_password

  enum role: [:default, :merchant, :admin]

  def disable_account
    deadtome = User.find(id)
    deadtome.enabled = false
    deadtome.save
  end

  def enable_account
    lazurus = User.find(id)
    lazurus.enabled = true
    lazurus.save
  end

  def upgrade_account(dir)
    pawn = User.find(id)
    pawn.role = 1 if dir == "up"
    pawn.role = 0 if dir == "down"
    pawn.save
  end

  def percent_sold
    total_inventory = self.items.map do |item|
      item.inventory
    end.sum

    total_sold = self.items.map do |item|
      OrderItem.where(item_id: item).pluck(:count)
    end.sum.sum
    (total_sold/total_inventory.to_f * 100).round(2)
  end

  def best_user
    users = User.where(role: "default").map do |user|
      user.orders.map do |order|
        if order.items.any? {|item| item.user_id == self.id}
          user
        end
      end
    end.flatten.uniq.compact

    users.sort_by do |user|
      user.orders.count
    end.last
  end

  def has_orders?
    have_orders = self.items.map do |item|
      OrderItem.where(item_id: item)
    end.flatten.empty?

    if have_orders
      false
    else
      true
    end
  end
end
