class User < ApplicationRecord
  validates_presence_of :first_name, :last_name, :street_address, :role, :city, :zip
  validates_presence_of :password, require: true

  has_many :order_items
  has_many :orders, through: :order_items
  has_many :user_states
  has_many :states, through: :user_states
  validates :email_address, presence: true, uniqueness: true

  has_secure_password
end
