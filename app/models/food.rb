class Food < ApplicationRecord
  belongs_to :location
  belongs_to :user
  has_one_attached :picture
  validates :name, :expiry, presence: true

  def expired?
    expired = Time.zone.today < expiry
    return "#{name} have expired" if expired == false
  end
end
