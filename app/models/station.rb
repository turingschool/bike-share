class Station < ActiveRecord::Base
  validates_presence_of :name, :dock_count, :city, :installation_date
  
  def self.average_bike_docks_per_station
    average(:dock_count).round(2)
  end

  def self.most_bikes_at_station
    maximum(:dock_count)
  end

  def self.stations_with_most_bikes
    stations = Station.where(dock_count: most_bikes_at_station)
    stations.reduce("") do |result, station|
      result += station[:name] += ", "
    end.chop.chop
  end

  def self.fewest_bikes_at_station
    minimum(:dock_count)
  end

  def self.stations_with_fewest_bikes
    stations = Station.where(dock_count: fewest_bikes_at_station)
    stations.reduce("") do |result, station|
      result += station[:name]
    end
  end

  def self.most_recent_station_date
     maximum(:installation_date)
  end

  def self.oldest_station_date
    minimum(:installation_date)
  end

  def self.most_recent_station
    stations = Station.where(installation_date: most_recent_station_date)
    stations.reduce("") do |result, station|
      result += station[:name]
    end
  end

  def self.oldest_station
     stations = Station.where(installation_date: oldest_station_date)
    stations.reduce("") do |result, station|
      result += station[:name] += ", "
    end.chop.chop
  end
end
