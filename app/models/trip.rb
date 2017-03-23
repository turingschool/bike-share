
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
    (self.sum(:duration) / self.count).to_i
  end

  def self.longest_ride
     self.maximum(:duration)
  end

  def self.shortest_ride
    self.minimum(:duration)
  end

  def self.station_with_most_rides_start_station
      binding.pry
      Trip.group(:start_station_name).count.max_by{|k,v| v}
    # station_counts = Hash.new(0)
    # self.all.each do |trip|
    #   binding.pry
    #   next unless found_station = Station.find_by(name:trip.start_station_name)
    #   station_counts[found_station.name] += 1
    # end
    # station_counts.max_by{|k,v| v}
  end

  def self.station_with_most_rides_end_station
      Trip.group(:end_station_name).count.max_by{|k,v| v}
    # station_counts = Hash.new(0)
    # self.all.each do |trip|
    #   next unless found_station = Station.find_by(name:trip.end_station_name)
    #   station_counts[found_station.name] += 1
    # end
    # station_counts.max_by{|k,v| v}
  end

  def self.bike_with_most_rides
      Trip.group(:bike_id).count.max_by{|k,v| v}
  end

  def self.bike_with_least_rides
      Trip.group(:bike_id).count.min_by{|k,v| v}
  end

  def self.date_with_highest_trips
    Trip.group(:start_date).count.max_by{|k,v| v}
  end

  def self.date_with_lowest_trips
    Trip.group(:start_date).count.min_by{|k,v| v}
  end

  def self.number_of_rides_started_at_station(station_name)
    Trip.where(start_station_name: station_name).count
  end

  def self.number_of_rides_ended_at_station(station_name)
    Trip.where(start_station_name: station_name).count
  end

  def self.number_of_rides_ended_at_station(station_name)
    Trip.where(end_station_name: station_name).count
  end


#   def month_method
# Month by Month breakdown of number of rides with subtotals for each year.
#
#   Get month from each start date and count the number of occurences in the table
#
#   January => 5
#
#   Trip.group(:start_station_date)
#
#   end


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
