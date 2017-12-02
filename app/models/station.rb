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

 def self.number_of_starting_rides(station_id)
  if Trip.group(:start_station_id).count[station_id]
     Trip.group(:start_station_id).count[station_id]
  else
    return 0
  end
 end

 def self.number_of_ending_rides(station_id)
  if Trip.group(:end_station_id).count[station_id]
   Trip.group(:end_station_id).count[station_id]
  else
    return 0
  end
 end

 def self.most_frequent_destination_station(station_id)
  if Station.find(station_id).trips_starting_here.group(:end_station_name).count.invert.max
    Station.find(station_id).trips_starting_here.group(:end_station_name).count.invert.max.last
  else
    return "No trips from this station."
  end
 end

 def self.most_frequent_origination_station(station_id)
  if Station.find(station_id).trips_ending_here.group(:start_station_name).count.invert.max
    Station.find(station_id).trips_ending_here.group(:start_station_name).count.invert.max.last
  else
    return "No trips to this station"
  end
 end

 def self.date_with_most_trips(station_id)
   if Station.find(station_id).trips_starting_here.group("DATE_TRUNC('day',start_date)").count.invert.max
     Station.find(station_id).trips_starting_here.group("DATE_TRUNC('day',start_date)").count.transform_keys do |key|
       key.to_date
     end.invert.max.last
   else
     "No trips."
   end
 end

 def self.most_frequent_zipcode_starting_here(station_id)
   if Station.find(station_id).trips_starting_here.group(:zip_code).count.invert.max
     Station.find(station_id).trips_starting_here.group(:zip_code).count.invert.max.last
   else
     "No trips."
   end
 end

end
