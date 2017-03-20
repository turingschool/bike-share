class Trip < ActiveRecord::Base
  belongs_to :station

  validates :duration, presence: true
  validates :start_date, presence: true
  # validates :start_station_name, presence: true
  validates :end_date, presence: true
  # validates :end_station_name, presence: true
  validates :bike_id, presence: true
  validates :subscription_type, presence: true

  def self.average_trip_duration
    average(:duration).round
  end

  def self.longest_ride
    maximum(:duration)
  end

  def self.shortest_ride
    minimum(:duration)
  end

#did not consider if there is a tie
  def self.most_start_station
    trips = Trip.all.map do |trip|
      trip.start_station_id
    end
    Station.find(trips.group_by(&:itself).values.max_by(&:size).first).name
  end

#did not consider if there is a tie
  def self.most_end_station
    trips = Trip.all.map do |trip|
      trip.end_station_id
    end
    Station.find(trips.group_by(&:itself).values.max_by(&:size).first).name
  end

end
