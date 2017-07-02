class Station < ActiveRecord::Base
  validates_presence_of :name, :city, :dock_count, :installation_date

  def self.total_count
    Station.count
  end

  def self.oldest_station
    Station.order(:installation_date).first
  end

  def self.station_with_most_bikes
    most_bikes = Station.maximum(:dock_count)
    Station.where(dock_count: most_bikes)
  end
end
