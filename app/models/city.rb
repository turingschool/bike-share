class City < ActiveRecord::Base
  has_many :station
	has_many :condition
  validates :name, presence: true
end
