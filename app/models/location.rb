class Location < ApplicationRecord
  belongs_to :fridge
  has_many :foods, dependent: :destroy
  validates :name, presence: true
end
