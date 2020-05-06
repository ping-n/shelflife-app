class Fridge < ApplicationRecord
  belongs_to :user
  has_many :location
end
