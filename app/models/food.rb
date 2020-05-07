class Food < ApplicationRecord
  belongs_to :location
  belongs_to :user
  has_one_attached :picture
  validates :name, :expiry, presence: true

  def expired?
    Time.zone.today > expiry ? true : false
  end
  def days_to_expiry
    if expiry_after_open
      ([expiry,expiry_after_open].min - Time.zone.today).to_i
    else
      (expiry - Time.zone.today).to_i
    end
  end
end
