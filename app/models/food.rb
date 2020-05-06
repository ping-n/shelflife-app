class Food < ApplicationRecord
  belongs_to :location
  belongs_to :user
  has_one_attached :picture
end
