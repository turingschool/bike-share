require 'pry'
class Station < ActiveRecord::Base
  has_many :trips_starting_here, :class_name => "Trip", :foreign_key => "start_station_id"
  has_many :trips_ending_here, :class_name => "Trip", :foreign_key => "end_station_id"

  validates_presence_of :name, :dock_count, :city, :installation_date

  def self.average_bike_docks_per_station
    average(:dock_count).round(2)
  end

  def self.most_bikes_at_station
    maximum(:dock_count)
  end

  def self.stations_with_most_bikes
    stations = Station.where(dock_count: most_bikes_at_station)
    station_ouput(stations)
  end

  def self.fewest_bikes_at_station
    minimum(:dock_count)
  end

  def self.stations_with_fewest_bikes
    stations = Station.where(dock_count: fewest_bikes_at_station)
    station_ouput(stations)
  end

  def self.most_recent_station_date
    maximum(:installation_date)
  end

  def self.oldest_station_date
    minimum(:installation_date)
  end

  def self.most_recent_station
    stations = Station.where(installation_date: most_recent_station_date)
    station_ouput(stations)
  end

  def self.oldest_station
    stations = Station.where(installation_date: oldest_station_date)
    station_ouput(stations)
  end

  def self.station_ouput(stations)
    stations.reduce("") do |result, station|
      result += station[:name] += ", "
    end.chop.chop
  end

  def self.most_rides_as_starting_place
    Station.all.group_by do |station|
      station.trips_starting_here.count
    end.max.last[0].name
  end

  def self.most_rides_as_ending_place
    Station.all.group_by do |station|
      station.trips_ending_here.count
    end.max.last[0].name
  end

 
end
