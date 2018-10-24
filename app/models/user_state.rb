class UserState < ApplicationRecord
  belongs_to :user
  belongs_to :state
end