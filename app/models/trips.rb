require 'will_paginate'
require 'will_paginate/active_record'

class Trip < ActiveRecord::Base
  belongs_to :start_station, class_name: "Station", foreign_key: "start_station_id"
  belongs_to :end_station, class_name: "Station", foreign_key: "end_station_id"


  validates_presence_of :duration,
                        :start_date,
                        :start_station_name,
                        :end_date,
                        :end_station_name,
                        :bike_id,
                        :subscription

  def self.average_duration
    average(:duration).to_i
  end

  def self.longest_ride
    maximum(:duration)
  end

  def self.shortest_ride
    minimum(:duration)
  end

  def self.popular_starting_place
    group('start_station_name').order('count(*) desc').limit(1).pluck(:start_station_name).first
  end

  def self.least_popular_starting_place
    group('start_station_name').order('count(*) asc').limit(1).pluck(:start_station_name).first
  end

  def self.popular_ending_place
    group('end_station_name').order('count(*) desc').limit(1).pluck(:end_station_name).first
  end

  def self.popular_bike
    group('bike_id').order('count(*) desc').limit(1).pluck(:bike_id).first
  end

  def self.popular_bikes_usage
    group(:bike_id).order('count_id desc').limit(1).count(:id).first[1]
  end

  def self.least_popular_bike
    group('bike_id').order('count(*) asc').limit(1).pluck(:bike_id).first
  end

  def self.least_popular_bikes_usage
    group(:bike_id).order('count_id asc').limit(1).count(:id).first[1]
  end

  def self.customer_count
    where(subscription: 'Customer').count
  end

  def self.customer_percentage
    ((self.customer_count / self.all.count.to_f)*100).round(2)
  end

  def self.subscriber_count
    where(subscription: 'Subscriber').count
  end

  def self.subscriber_percentage
    ((self.subscriber_count / self.all.count.to_f)*100).round(2)
  end

  def self.date_with_highest_trips
    group(:start_date).order('count_id desc').limit(1).count(:id).first[0]
  end

  def self.highest_trip_date_count
    group(:start_date).order('count_id desc').limit(1).count(:id).first[1]
  end

  def self.date_with_lowest_trips
    group(:start_date).order('count_id asc').limit(1).count(:id).first[0]
  end

  def self.lowest_trip_date_count
    group(:start_date).order('count_id asc').limit(1).count(:id).first[1]
  end

  def self.month_by_month_breakdown
    group("DATE_TRUNC('month', start_date)").count.to_a.sort
  end

  def self.year_subtotals
    group("DATE_TRUNC('year', start_date)").count.to_a.sort
  end

  def self.most_frequent_destination(station_name)
    station = Trip.where(start_station_name: station_name).group(:end_station_name).order('count(*) DESC').count(:start_station_name).first
    if station
      station.first
    else
      "Not enough data"
    end
  end

  def self.most_frequent_origination_station(station_name)
    station = Trip.where(end_station_name: station_name).group(:start_station_name).order('count(*) DESC').count(:end_station_name).first
    if station
      station.first
    else
      "Not enough data"
    end
  end

  def self.number_trips_started_at_station(station_name)
    station = Trip.where(start_station_name: station_name).group(:start_station_name).order('count(*) DESC').count.first[1]
  end

  def self.number_trips_ended_at_station(station_name)
    station = Trip.where(end_station_name: station_name).group(:end_station_name).order('count(*) DESC').count.first[1]
  end

  def self.date_with_highest_trips(station_name)
    date = Trip.where(start_station_name: station_name).group(:start_date).order('count(*) DESC').count.first[0]

  end

  def self.most_frequent_user_zipcodes(station_name)
    zipcode = Trip.where(start_station_name: station_name).group(:zip_code).order('count(*) DESC').count.first[0]
  end


end
