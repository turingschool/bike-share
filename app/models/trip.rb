class Trip < ActiveRecord::Base
  belongs_to :station

  validates_presence_of :duration,
                        :start_date,
                        :start_station_name,
                        :start_station_id,
                        :end_date,
                        :end_station_name,
                        :end_station_id,
                        :bike_id,
                        :subscription_type

  def self.average_ride_duration
    average(:duration).round(2)
  end

  def self.longest_ride
    maximum(:duration)
  end

  def self.shortest_ride
    minimum(:duration)
  end

  def self.most_ridden_bike
    array = Trip.pluck(:bike_id)    #this is an array
    #now find mode of array
  end

  def self.least_ridden_bike
    array = Trip.pluck(:bike_id)    #this is an array
  end
end
