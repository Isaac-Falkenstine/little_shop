class User < ApplicationRecord
  validates_presence_of :first_name, :last_name, :street_address, :city, :state, :zip
  validates_presence_of :password, require: true, on: :create
  validates :email_address, presence: true, uniqueness: true

  has_many :orders
  has_many :items


  has_secure_password

  enum role: [:default, :merchant, :admin]
end
