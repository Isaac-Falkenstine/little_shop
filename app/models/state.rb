class State < ApplicationRecord
  validates_presence_of :name, :abbr

  belongs_to :user
end
