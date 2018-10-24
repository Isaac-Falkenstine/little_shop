class Location < ApplicationRecord
  validates_presence_of :city, :zip

  belongs_to :user
end
