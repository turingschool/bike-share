class Trip < ActiveRecord::Base
  belongs_to :zipcode
  belongs_to :start_station, :foreign_key => :start_station_id, :class_name => 'Station'
  belongs_to :end_station, :foreign_key => :end_station_id, :class_name => 'Station'
  validates :duration, presence: true
  validates :start_date, presence: true
  validates :start_station_id, presence: true
  validates :end_date, presence: true
  validates :end_station_id, presence: true
  validates :bike_id, presence: true
  validates :subscription_type, presence: true

  def format_start_date_time
    start_date.strftime('%m/%d/%Y %H:%M')
  end

  def format_end_date_time
    end_date.strftime('%m/%d/%Y %H:%M')
  end

  def self.average_duration
    Trip.average(:duration)
  end

  def self.longest_ride
    Trip.maximum(:duration)
  end

  def self.shortest_ride
    Trip.minimum(:duration)
  end

  def self.starting_station_most_rides
    Trip.where(start_station_name: Trip.maximum(:start_station_name))
  end
end
