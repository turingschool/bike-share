require 'will_paginate'
require 'will_paginate/active_record'
require_relative "station"

class Trip < ActiveRecord::Base

  validates_presence_of :duration, :start_date, :end_date, :bike_id, :subscription_type

  #has_many :stations

  acts_as_copy_target #this is from the postgres-copy gem

  def self.per_page
    30
  end


  def self.avg_duration_of_a_ride
    seconds = average(:duration)
    minutes = seconds / 60
    minutes.round
  end

  def self.longest_ride
    seconds = maximum(:duration)
    minutes = seconds / 60
    minutes / 60
  end

  def self.shortest_ride
    minimum(:duration)
  end

  def self.station_with_most_ride_starts
    trip = Trip.group(:start_station_id).order('count_id DESC').limit(1).count(:id).first[0]
    Station.find(trip)[:name]
  end

  def self.station_with_most_rides_ends
    trip = Trip.group(:end_station_id).order('count_id DESC').limit(1).count(:id).first[0]
    Station.find(trip)[:name]
  end

  def self.month_breakdown
    group('(EXTRACT(YEAR FROM end_date))::integer').group('(EXTRACT(MONTH FROM end_date))::integer').order('count_all DESC').count
  end

  def self.most_ridden_bike
    group(:bike_id).order('count_id DESC').count(:id).first.first
  end

  def self.least_ridden_bike
    group(:bike_id).order('count_id ASC').count(:id).first.first
  end

  def self.subscription_info
    group(:subscription_type).limit(2).count(:id)
  end

  def self.subscriber_percentage
    subscription_hash = Trip.group(:subscription_type)
    .limit(2)
    .count(:id)
    total = subscription_hash.values.reduce(:+).to_f
    (subscription_hash["Subscriber"] / total * 100).round(2)
  end

  def self.customer_percentage
    subscription_hash = Trip.group(:subscription_type)
    .limit(2)
    .count(:id)
    total = subscription_hash.values.reduce(:+).to_f
    (subscription_hash["Customer"] / total * 100).round(2)
  end

  def self.date_with_highest_trips
    date = Trip.group('(EXTRACT(MONTH FROM start_date))::integer').group('(EXTRACT(DAY FROM start_date))::integer').group('(EXTRACT(YEAR FROM start_date))::integer').order('count_all DESC').count.first
    date_string = "#{date[0][2]}-#{date[0][0]}-#{date[0][1]}"
    Date.parse(date_string)
  end

  def self.date_with_highest_trips
    date = Trip.group('(EXTRACT(MONTH FROM start_date))::integer').group('(EXTRACT(DAY FROM start_date))::integer').group('(EXTRACT(YEAR FROM start_date))::integer').order('count_all DESC').count.first
    date_string = "#{date[0][2]}-#{date[0][0]}-#{date[0][1]}"
    Date.parse(date_string)
  end

  def self.count_of_highest_trips
    date = Trip.group('(EXTRACT(MONTH FROM start_date))::integer').group('(EXTRACT(DAY FROM start_date))::integer').group('(EXTRACT(YEAR FROM start_date))::integer').order('count_all DESC').count.first
    "#{date[1]}"
  end

  def self.date_with_fewest_trips
    date = Trip.group('(EXTRACT(MONTH FROM start_date))::integer').group('(EXTRACT(DAY FROM start_date))::integer').group('(EXTRACT(YEAR FROM start_date))::integer').order('count_all').count.first
    date_string = "#{date[0][2]}-#{date[0][0]}-#{date[0][1]}"
    Date.parse(date_string)
  end

  def self.count_of_fewest_trips
    date = Trip.group('(EXTRACT(MONTH FROM start_date))::integer').group('(EXTRACT(DAY FROM start_date))::integer').group('(EXTRACT(YEAR FROM start_date))::integer').order('count_all').count.first
    "#{date[1]}"
  end

  def self.number_of_starting_rides_at_station(station_id)
    if Trip.where(start_station_id: station_id) == []
      "None"
    else
      stations = Trip.group(:start_station_id).count(:id)
      stations[station_id]
    end
  end

  def self.number_of_ending_rides_at_station(station_id)
    if Trip.where(start_station_id: station_id) == []
      "None"
    else
      stations = Trip.group(:end_station_id).count(:id)
      stations[station_id]
    end
  end

  def self.most_frequent_destination(station_id)
    if Trip.where(start_station_id: station_id) == []
      "None"
    else
      station = Trip.where(start_station_id: station_id).group(:end_station_id).order('count_id DESC').count(:id).first
      Station.find(station[0])[:name]
    end
  end

  def self.most_frequent_origination(station_id)
    if Trip.where(start_station_id: station_id) == []
      "None"
    else
      station = Trip.where(end_station_id: station_id).group(:start_station_id).order('count_id DESC').count(:id).first
      Station.find(station[0])[:name]
    end
  end

  def self.date_with_highest_trip_from_this_station(station_id)
    if Trip.where(start_station_id: station_id) == []
      "None"
    else
      date = Trip.where(start_station_id: station_id).group('(EXTRACT(MONTH FROM start_date))::integer').group('(EXTRACT(DAY FROM start_date))::integer').group('(EXTRACT(YEAR FROM start_date))::integer').order('count_all').reverse_order.count.first
      date_string = "#{date[0][2]}-#{date[0][0]}-#{date[0][1]}"
      Date.parse(date_string)
    end
  end

  def self.most_frequent_zip_code_users_starting(station_id)
    if Trip.where(start_station_id: station_id) == []
      "None"
    else
      where(start_station_id: station_id).group(:zip_code).order('count_id DESC').count(:id).first[0]
    end
  end

  def self.most_frequent_bike_starting(station_id)
    if Trip.where(start_station_id: station_id) == []
      "None"
    else
      where(start_station_id: station_id).group(:bike_id).order('count_id DESC').count(:id).first[0]
    end
  end

end
