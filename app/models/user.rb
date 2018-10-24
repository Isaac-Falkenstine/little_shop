class User < ApplicationRecord
  validates_presence_of :first_name, :last_name, :street_address, :email_address, :password, :role, :city, :zip

  has_many :order_items
  has_many :orders, through: :order_items
  has_many :user_states
  has_many :states, through: :user_states

  has_secure_password
end
