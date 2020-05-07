class Food < ApplicationRecord
  belongs_to :location
  belongs_to :user
  has_one_attached :picture
  validates :name, :expiry, presence: true

  def expired?
    expired = Date.today < self.expiry
    if expired == false
      return "#{self.name} have expired"
    end
  end
end
