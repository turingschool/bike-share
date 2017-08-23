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
    (average(:duration) / 60).floor
  end

  def self.longest
    maximum(:duration) / 60
  end

  def self.shortest
    minimum(:duration) / 60
  end

  def self.station_with_most_starts
    station_id = group(:start_station).order("count_id DESC").count(:id).first[0]
    Station.find(station_id).name
  end

  def self.station_with_most_ends
    station_id = group(:end_station).order("count_id DESC").count(:id).first[0]
    Station.find(station_id).name
  end

  def self.most_trips_by_date
    date = group(:trip_date).order("count_id DESC").count(:id).first
    day = date[0]
    ride_count = date[1]
    return day.to_s, ride_count
  end

  def self.fewest_trips_by_date
    date = group(:trip_date).order("count_id").count(:id).first
    day = date[0]
    ride_count = date[1]
    return day.to_s, ride_count
  end


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

  def self.subscriber_percentage
    total = group(:subscription_type_id).order("count_id").count(:id).values
    sub_percentage = (total.first.to_f / total.reduce(:+) * 100).round.to_s + '%'
    cust_percentage = (total.second.to_f / total.reduce(:+) * 100).round.to_s + '%'
    return sub_percentage, cust_percentage
  end

  def self.subscriber_count
    count = group(:subscription_type_id).order("count_id").count(:id)
    subscribers = count[1]
    customers = count[2]
    return subscribers, customers
  end

  def self.trip_count_by_month
    group("DATE_TRUNC('month', trip_date)").count(:trip_date)
  end

  def self.trip_count_by_year
    group("DATE_TRUNC('year', trip_date)").count(:trip_date)
  end

  def self.parse_yearly_trips_as_html
    parse_string = ""
    trip_count_by_month.each do |date, trips|
    parse_string += "<p> #{Date::MONTHNAMES[date.month]} #{date.year} had #{trips} trips </p>"
    end
    parse_string
  end

  def self.find_by_date(date, zip_code = 94107)
    joins(:zip_code)
    .where("trip_date = ? AND zip_code = ?", date, zip_code)
    .count
  end

end
