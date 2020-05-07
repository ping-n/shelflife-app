class Location < ApplicationRecord
  belongs_to :fridge
  has_many :foods, dependent: :destroy
end
