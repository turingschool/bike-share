require 'time_difference'

class Trip < ActiveRecord::Base
  belongs_to :subscription_type

  validates :duration, presence: true
  validates :start_date, presence: true
  validates :start_station_name, presence: true
  validates :end_date, presence: true
  validates :end_station_name, presence: true
  validates :bike_id, presence: true
  validates :subscription_type_id, presence: true
  validates :zip_code, presence: true

  def self.order_by_date
    self.order(:start_date).reverse
  end

  def self.average_ride_duration
    (self.sum(:duration) / self.count)
  end

  def self.longest_ride
     self.maximum(:duration)
  end

  def self.shortest_ride
    self.minimum(:duration)
  end

  #wrote these before we realized there is a duration field in trips data... lol

  # def self.trip_duration_set
  #   trips = self.all
  #   trips.map { |trip| TimeDifference.between(trip.end_date, trip.start_date).in_minutes }
  # end
  #
  # def self.average_ride_duration
  #   set = trip_duration_set
  #   ((set.reduce(:+)) / (set.count)).round(1)
  # end
  #
  # def self.longest_ride
  #   self.trip_duration_set.max
  # end
  #
  # def self.shortest_ride
  #   self.trip_duration_set.min
  # end


end
