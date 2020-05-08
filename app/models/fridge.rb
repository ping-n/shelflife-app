class Fridge < ApplicationRecord
  belongs_to :user
  has_many :location, dependent: :destroy
  validates :name, presence: true
end
