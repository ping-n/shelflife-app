class Location < ApplicationRecord
  belongs_to :fridge
  has_many :foods
end
