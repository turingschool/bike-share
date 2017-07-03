require_relative "station"
class Trip < ActiveRecord::Base
  validates_presence_of :duration, :start_date, :end_date, :start_station_id, :end_station_id, :bike_id, :subscription_id
  belongs_to :subscription

  def self.average_duration
    Trip.average(:duration)
  end

  def self.longest_ride
    Trip.maximum(:duration)
  end

  def self.shortest_ride
    Trip.minimum(:duration)
  end

  def self.start_station_with_most_rides
    trip = Trip.group(:start_station_id).order('count_id DESC').limit(1).count(:id).first[0]
    Station.find(trip)[:name]
  end

  def self.end_station_with_most_rides
    trip = Trip.group(:end_station_id).order('count_id').limit(1).count(:id).first[0]
    Station.find(trip)(:name)
  end

  def month_summary

  end
end
