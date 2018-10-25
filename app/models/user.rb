class User < ApplicationRecord
  validates_presence_of :first_name, :last_name, :street_address, :city, :zip, :state
  validates_presence_of :password, require: true, on: :create
  validates :email_address, presence: true, uniqueness: true

  has_many :orders


  has_secure_password

  enum role: [:default, :merchant, :admin]
end
