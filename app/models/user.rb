class User < ApplicationRecord
  validates_presence_of :first_name, :last_name, :street_address, :email_address, :password, :role

  has_many :orders
  has_many :locations
end
