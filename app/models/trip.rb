class Trip < ActiveRecord::Base

  belongs_to :bike
  belongs_to :weather_condition

  belongs_to :start_station, foreign_key: 'start_station_id', class_name: 'Station'
  belongs_to :end_station, foreign_key: 'end_station_id', class_name: 'Station'

  validates :duration, presence: true
  validates :start_date, presence: true, uniqueness: {scope: :bike}
  validates :end_date, presence: true
  validates :subscription_type, presence: true

  scope :ordered, -> { order(:start_date) }

  def make_name
    date = start_date.strftime('%-m/%-d/%Y')
    start_name = Station.find(start_station_id).name
    end_name = Station.find(end_station_id).name
    "#{date}: #{start_name} -> #{end_name}"
  end

  def self.average_duration
    Trip.average(:duration).to_i
  end

  def self.longest_rides
    max = Trip.maximum(:duration)
    Trip.select {|t| t.duration == max}
  end

  def self.shortest_rides
    min = Trip.minimum(:duration)
    Trip.select {|t| t.duration == min}
  end

  def self.most_popular_start_stations
    max = Station.all.max_by do |station|
      station.start_trips.count
    end.start_trips.count
    Station.select {|s| s.start_trips.count == max}
  end

  def self.most_popular_end_stations
    max = Station.all.max_by do |station|
      station.end_trips.count
    end.end_trips.count
    Station.select {|s| s.end_trips.count == max}
  end

  def self.most_popular_bikes
    max = Bike.all.max_by do |bike|
      bike.trips.count
    end.trips.count

    Bike.select {|b| b.trips.count == max}
  end

  def self.most_popular_bike_trips_count
    max = Bike.all.max_by do |bike|
      bike.trips.count
    end.trips.count
  end

  def self.least_popular_bikes
    min = Bike.all.min_by do |bike|
      bike.trips.count
    end.trips.count

    Bike.select {|b| b.trips.count == min}
  end

  def self.least_popular_bike_trips_count
    min = Bike.all.min_by do |bike|
      bike.trips.count
    end.trips.count
  end

  def self.subscribers_count
    Trip.select{|t|t.subscription_type == 'subscriber'}.count
  end

  def self.subscribers_percentage
    self.subscribers_count / self.all.count.to_f
  end

  def self.customers_count
    Trip.select{|t|t.subscription_type == 'customer'}.count
  end

  def self.customers_percentage
    self.customers_count / self.all.count.to_f
  end

  # def self.busiest_days
  #   trip_days = Trip.pluck(:start_date).map(&:to_date).uniq

  #   max = trip_days.max_by do |day|

  #   end
  # end
end

#add trip-dashboard methods and trip dashboard file laters