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

end
