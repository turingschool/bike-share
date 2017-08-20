require 'will_paginate'
require 'will_paginate/active_record'
require 'Time'

class Trip < ActiveRecord::Base
  validates :duration, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :start_station_id, presence: true
  validates :end_station_id, presence: true
  validates :bike_id, presence: true
  validates :subscription_type, presence: true

  belongs_to :start_station, class_name: "Station", foreign_key: "start_station_id"
  belongs_to :end_station, class_name: "Station", foreign_key: "end_station_id"

  def self.average_duration_of_a_trip
    a = Trip.average("duration").to_i
    Time.at(a).utc.strftime("%M:%S")
  end

  def self.longest_ride
    a = Trip.maximum(:duration)
    time_converter(a)
  end

  def self.time_converter(totalseconds)
    total_seconds = totalseconds.to_i
    days = nil

    if total_seconds >= 86400
      days = total_seconds / 86400
      total_seconds = total_seconds % 86400
    end

    "#{days} days"
  end

  def self.shortest_ride
    a = Trip.minimum(:duration).to_i
    Time.at(a).utc.strftime("%M:%S")
  end

  def self.monthly_ride_breakdown
    Trip.group("DATE_TRUNC('month', start_date)").count
  end

  def self.yearly_ride_breakdown
    Trip.group("DATE_TRUNC('year', start_date)").count
  end

  def self.hottest_bike
    Trip.group(:bike_id).order("count_id DESC").count(:id).keys.first
  end

  def self.most_neglected_bike
    Trip.group(:bike_id).order("count_id ASC").count(:id).keys.first
  end

end
