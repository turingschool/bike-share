require_relative "station"
require_relative "subscription"
require 'pry'
class Trip < ActiveRecord::Base
  validates_presence_of :duration, :start_date, :end_date, :start_station_id, :end_station_id, :bike_id, :subscription_id
  belongs_to :subscription

  def self.average_duration
    Trip.average(:duration).round(2)
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
    Station.find(trip)[:name]
  end

  def self.month_summary
    dates = Trip.group('(EXTRACT(YEAR FROM end_date))::integer').group('(EXTRACT(MONTH FROM end_date))::integer').order('count_all DESC').count
  end

  def self.most_ridden_bike
    Trip.group(:bike_id).order('count_id DESC').limit(1).count(:id).first
  end

  def self.least_ridden_bikes
    Trip.group(:bike_id).order('count_id').limit(1).count(:id).first
  end

  def self.subscription_info
    Trip.group(:subscription_id).limit(2).count(:id)
  end

  def self.subscription_percentage(amount)
    total = Trip.group(:subscription_id).limit(2).count(:id).values.reduce(:+)
    (amount / total.to_f * 100).round(2)
  end

  def self.date_with_highest_trip_count
    Trip.group('(EXTRACT(MONTH FROM start_date))::integer').group('(EXTRACT(DAY FROM start_date))::integer').group('(EXTRACT(YEAR FROM start_date))::integer').order('count_all DESC').count.first
  end

  def self.date_with_lowest_trip_count
    Trip.group('(EXTRACT(MONTH FROM start_date))::integer').group('(EXTRACT(DAY FROM start_date))::integer').group('(EXTRACT(YEAR FROM start_date))::integer').order('count_all').count.first
  end

  def self.number_of_starting_rides_at_station(station_id)
    stations = Trip.group(:start_station_id).count(:id)
    stations[station_id]
  end

  def self.number_of_ending_rides_at_station(station_id)
    stations = Trip.group(:end_station_id).count(:id)
    stations[station_id]
  end

  def self.most_frequent_destination(station_id)
    station = Trip.where(start_station_id: station_id).group(:end_station_id).order('count_id DESC').count(:id).first
    Station.find(station[0])[:name]
  end

  def self.most_frequent_origination(station_id)
    station = Trip.where(end_station_id: station_id).group(:start_station_id).order('count_id DESC').count(:id).first
    Station.find(station[0])[:name]
  end

  def self.date_with_highest_trip_from_this_station(station_id)
    date = Trip.where(start_station_id: station_id).group('(EXTRACT(MONTH FROM start_date))::integer').group('(EXTRACT(DAY FROM start_date))::integer').group('(EXTRACT(YEAR FROM start_date))::integer').order('count_all').count.first
    "#{date[0][0]}/#{date[0][1]}/#{date[0][2]}"
  end

  def self.most_frequent_zip_code_users_starting(station_id)
    Trip.where(start_station_id: station_id).group(:zip_code).order('count_id DESC').count(:id).first[0]
  end

  def self.most_frequent_bike_starting(station_id)
    Trip.where(start_station_id: station_id).group(:bike_id).order('count_id DESC').count(:id).first[0]
  end
end
