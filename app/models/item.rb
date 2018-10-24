class Item < ApplicationRecord
  validates_presence_of :name, :thumbnail, :price, :inventory, :description

  
end
