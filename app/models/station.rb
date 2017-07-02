class Station < ActiveRecord::Base

  validates_presence_of :name, :city, :dock_count, :installation_date

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
