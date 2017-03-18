class City < ActiveRecord::Base
  has_many :stations

#  validates :name, presence: true
  validates_uniqueness_of :name
end
