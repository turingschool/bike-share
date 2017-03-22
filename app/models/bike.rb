class Bike < ActiveRecord::Base
  has_many :trips

  validates :bin, presence: true, uniqueness: true
end