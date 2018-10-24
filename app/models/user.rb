class User < ApplicationRecord
  validates_presence_of :first_name, :last_name, :street_address, :city, :zip
  validates_presence_of :password, require: true
  validates :email_address, presence: true, uniqueness: true

  has_many :orders
  belongs_to :state

  has_secure_password

  enum role: %w(default merchant admin)
end
