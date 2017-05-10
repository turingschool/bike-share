class City < ActiveRecord::Base
  has_many :station
	has_many :conditions
  validates :name, presence: true
end
