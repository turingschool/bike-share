class RideDate < ActiveRecord::Base
  has_many :trips

  validates :day, presence: true
  validates :month, presence: true
  validates :year, presence: true
end