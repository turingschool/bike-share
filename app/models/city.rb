class City < ActiveRecord::Base
  has_many :stations
	has_many :weather
end
