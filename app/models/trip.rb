class Trip < ActiveRecord::Base

  validates :duration, presence: true
  validates :start_date, presence: true
  validates :start_station_name, presence: true
  validates :start_station_id, presence: true
  validates :end_date, presence: true
  validates :end_station_name, presence: true
  validates :end_station_id, presence: true
  validates :bike_id, presence: true
  validates :subscription_type, presence: true

  def self.average_duration
    Trip.average(:duration).to_i
  end

  def self.longest_ride
    Trip.maximum(:duration)
  end

  def self.shortest_ride
    Trip.minimum(:duration)
  end
end
