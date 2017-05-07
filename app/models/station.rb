require 'pry'

class Station < ActiveRecord::Base
  belongs_to :city

  validates :name, presence: true
  validates :city_id, presence: true
  validates :dock_count, presence: true
  validates :installation_date, presence: true

  def update_city_id(city_name, station)
    city = City.find_by name: city_name
    station.update city_id: city.id
  end
end
