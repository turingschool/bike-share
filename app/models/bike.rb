class Bike < ActiveRecord::Base
  belongs_to :trip

  validates :bin, presence: true
end