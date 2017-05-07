require_relative './station'

class City < ActiveRecord::Base
  validates :name, presence: true
  has_many :stations

  # query_stations_for_city
  def self.query_stations(city)
    Station.where(city_id: city)
  end
end
