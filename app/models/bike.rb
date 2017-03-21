class Bike < ActiveRecord::Base
  has_many :trips

  validates :bike_number, presence: true
end