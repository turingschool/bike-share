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

  def self.average_ride_length
    average :duration
  end

  def self.trip_of_longest_length
    where duration: (maximum :duration)
  end

  def self.trip_of_shortest_length
    where duration: (minimum :duration)
  end

  def self.starting_station_with_most_rides #THIS WORKS!!!
    get_id = group(:start_station_id).order(start_station_id: :desc).count(:start_station_id).first[0]
    Station.find(get_id).name
  end

  def self.ending_station_with_most_rides
    get_id = group(:end_station_id).order(end_station_id: :desc).count(:end_station_id).first[0]
    Station.find(get_id).name
  end             

  def self.rides_per_month
    group("DATE_TRUNC('month', end_date)").count
  end

  def self.rides_per_year
    group("DATE_TRUNC('year', end_date)").count
  end

  def self.year_month_subtotals
    years = {}  
    rides_per_month.each do |timestamp, month_count|
      y = timestamp.year
      years[y] ||= { "January"=> 0,  "February"=> 0, "March"=> 0,
                      "April"=> 0,   "May"=> 0,      "June"=> 0,
                      "July"=> 0,    "August"=> 0,   "September"=> 0,
                      "October"=> 0, "November"=> 0, "December"=> 0,
                      "Subtotal"=> 0 }
      m = timestamp.strftime('%B')
      years[y][m] += month_count
    end
    years.each_value { |counts| counts["Subtotal"] = counts.values.sum }
  end
end

=begin

Month by Month breakdown of number of rides with subtotals for each year.
Most ridden bike with total number of rides for that bike.
Least ridden bike with total number of rides for that bike.
User subscription type breakout with both count and percentage.
Single date with the highest number of trips with a count of those trips.
Single date with the lowest number of trips with a count of those trips.

rides_per_year
    
yearly_rides_per_month "rides per month per year"
first_trip = minimum(:date)

SELECT EXTRACT(MONTH FROM "2017-06-15")

subtotal of each year
subtotal of each month

per row group by ending date column
order by descending

top_biker
rides_per_bike
bottom_biker
subscription_count
subscription_percentage
date_with_highest_trips
date_with_lowest_trips

=end
