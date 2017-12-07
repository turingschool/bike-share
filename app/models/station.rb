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
    where(dock_count: most_bikes_at_station)
  end

  def self.fewest_bikes_at_station
    minimum(:dock_count)
  end

  def self.stations_with_fewest_bikes
    where(dock_count: fewest_bikes_at_station)
  end

  def self.most_recent_station_date
    maximum(:installation_date)
  end

  def self.most_recent_station
    where(installation_date: most_recent_station_date)
  end

  def self.oldest_station_date
    minimum(:installation_date)
  end

  def self.oldest_station
    where(installation_date: oldest_station_date)
  end

  def self.most_rides_as_starting_place
    all.group_by do |station|
      station.trips_starting_here.count
    end.max.last[0].name
  end
################# USE ACTIVE RECORD HERE ##########
  def self.most_rides_as_ending_place
    # trips_ending_here.group(:end_station_name).count
    all.group_by do |station|
      station.trips_ending_here.count
    end.max.last[0].name
  end

 def number_of_starting_rides
   trips_starting_here.count
 end

 def number_of_ending_rides
   trips_ending_here.count
 end

 def most_frequent_destination_station
   trips_starting_here.group(:end_station_name).count.invert.max
   # trips_starting_here.select("trips.*, count(end_station_id) AS station_count")
   # .group(:end_station_name, :id)
   # .order("station_count")
   # .limit(1).first.end_station_name
 end

 def most_frequent_origination_station
    trips_ending_here.group(:start_station_name).count.invert.max
    # trips_ending_here.select("trips.*, count(start_station_id) AS station_count")
    # .group(:start_station_name, :id)
    # .order("station_count")
    # .limit(1).first.start_station_name
 end

 def date_with_most_trips
   trips_starting_here.group("DATE_TRUNC('day',start_date)").count.transform_keys do |key|
     key.to_date
   end.invert.max
 end

 def most_frequent_zipcode_starting_here
   trips_starting_here.group(:zip_code).count.invert.max
 end

 def most_frequent_bike_id_starting_here
   trips_starting_here.group(:bike_id).count.invert.max
 end

end
