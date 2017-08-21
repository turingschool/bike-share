class City < ActiveRecord::Base
  has_many :stations

  validates :city, presence: true, uniqueness: true
end