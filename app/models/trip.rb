require "will_paginate"
require "will_paginate/active_record"

class Trip < ActiveRecord::Base
  has_many :stations
  belongs_to :zip_code
  belongs_to :subscription_type


  validates :duration, presence: true
  validates :start_station, presence: true
  validates :end_station, presence: true
  validates :bike_id, presence: true
  validates :subscription_type_id, presence: true
  validates :trip_date, presence: true


  def self.find_thirty_trips(number_of_records = 30)
    first(number_of_records)
  end

  def self.sort_trips_by_date
    order(:start_date)
  end

  def self.average_duration
    average(:duration).to_f.round(2)
  end

  def self.longest
    maximum(:duration)
  end

  def self.shortest
    minimum(:duration)
  end

  def self.station_with_most_starts
    station_id = group(:start_station).order("count_id DESC").count(:id).first[0]
    Station.find(station_id).name
  end

  def self.station_with_most_ends
    station_id = group(:end_station).order("count_id DESC").count(:id).first[0]
    Station.find(station_id).name
  end

  # def self.trip_count_by_month
  #   months = {}
  #   count = group("DATE_TRUNC('month', trip_date)").order("count(trips.id) DESC").select("count(trips.id) AS trips_count").limit(1).first.trips_count
  # end

  def self.bike_with_most_rides
      bike = group(:bike_id).order("count_id DESC").count(:id).first
      bike_id = bike[0]
      bike_count = bike[1]
      return bike_id, bike_count
  end

  def self.bike_with_least_rides
    bike = group(:bike_id).order("count_id").count(:id).first
    bike_id = bike[0]
    bike_count = bike[1]
    return bike_id, bike_count
  end

  # def self.subscriber_percentage
  #
  # end

  def self.subscriber_count
    count = Trip.group(:subscription_type_id).order("count_id").count(:id)
    subscribers = count[1]
    customers = count[2]
    return customers, subscribers
  end

end
