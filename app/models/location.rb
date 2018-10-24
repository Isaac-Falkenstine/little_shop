class Location < ApplicationRecord
  validates_presence_of :city, :zip

  
end
