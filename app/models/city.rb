class City < ActiveRecord::Base
  validates :name, presence: true
  has_many :stations

  # query_stations_for_city
end
