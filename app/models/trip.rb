class Trip < ActiveRecord::Base
  validates :duration, presence: true
  validates :start_date, presence: true
  validates :start_station_id, presence: true
  validates :end_date, presence: true
  validates :end_station_id, presence: true
  validates :bike_id, presence: true
  validates :subscription_type, presence: true
  belongs_to :station

  def self.average_duration_of_ride
    Trip.average(:duration)
  end

  def self.longest_ride
    Trip.maximum(:duration)
  end

  def self.shortest_ride
    Trip.minimum(:duration)
  end

  def self.station_with_most_rides_as_starting_place
    Trip.group(:start_station_id).order('count_id DESC').count(:id)
  end








end
