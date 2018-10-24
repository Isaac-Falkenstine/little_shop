class User < ApplicationRecord
  validates_presence_of :name, require: true
  validates_presence_of :street_address, require: true
  validates_presence_of :city, require: true
  validates_presence_of :state, require: true
  validates_presence_of :zip_code, require: true
  validates :email, presence: true, uniqueness: true
  validates_presence_of :password, require: true

  has_secure_password

  enum role: %w(default admin)
end
