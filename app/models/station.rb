class Station < ActiveRecord::Base
  validates_presence_of :name, :city, :dock_count, :installation_date

  def self.least_number_of_available_bikes
    Station.pluck(:dock_count).min

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

  def self.average_bikes_available_per_station
    average(:dock_count).round
  end

  def self.most_recently_installed
    self.order(:installation_date).last
  end

  def self.stations_with_fewest_bikes_available
    station = Station.minimum(:dock_count)
    Station.where(dock_count: station)
  end
end
