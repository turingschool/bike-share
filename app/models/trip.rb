class Trip < ActiveRecord::Base
    belongs_to :start_station, class_name: "Station"
    belongs_to :end_station,   class_name: "Station"

    validates_presence_of :duration,
                          :start_date,
                          :start_station_id,
                          :end_date,
                          :end_station_id,
                          :bike_id,
                          :subscription_type,
                          :zip_code


  def self.average_ride_length
    average :duration
  end

  def self.trip_of_longest_length
    maximum :duration
  end

  def self.trip_of_longest_length
    minimum :duration
  end

  def self.starting_station_with_most_rides #THIS WORKS!!!
    get_id = group(:start_station_id).order(start_station_id: :desc).count(:id).first[0]
    Station.find(get_id).name
  end

  def self.starting_station_with_most_rides
    get_id = group(:end_station_id).order(end_station_id: :desc).count(:id).first[0]
    Station.find(get_id).name
  end


  def to_s
    "Trip ##{id} #{route}"
  end

  def route
    return "near #{start_station_name}" if round_trip?
    "from #{start_station_name} to #{end_station_name}"
  end

  def timeframe
    return "on #{start_date}" if same_day?
    "from #{start_date} to #{end_date}"
  end

  def round_trip?
    start_station_id == end_station_id
  end

  def same_day?
    start_date == end_date
  end

  def start_station_name
    start_station.name
  end

  def end_station_name
    end_station.name
  end

  def self.top_rider
    group('bike_id').order('bike_id DESC').count.first[0]
  end

  def self.rides_per_top_rider
    group('bike_id').order("bike_id DESC").count.first[1]
  end

  def self.bottom_rider
    group('bike_id').order('bike_id ASC').count.first[0]
  end

  def self.rides_per_bottom_rider
    group('bike_id').order("bike_id ASC").count.first[0]
  end

  def self.subscription_count
    count('subscription_type')
  end


  def self.subscription_percentage
    group('subscription_type').count
  end

  def self.subscription_type_breakout
    total = count
    var = group('subscription_type').count
    var2 = var.transform_values do |subtotal|
      {
        subtotal: subtotal,
        percentage: subtotal * 100 / total
      }
    end
  end


end

=begin

Month by Month breakdown of number of rides with subtotals for each year.
Most ridden bike with total number of rides for that bike.
Least ridden bike with total number of rides for that bike.
User subscription type breakout with both count and percentage.
Single date with the highest number of trips with a count of those trips.
Single date with the lowest number of trips with a count of those trips.

subscription_count
subscription_percentage
date_with_highest_trips
date_with_lowest_trips



=end
