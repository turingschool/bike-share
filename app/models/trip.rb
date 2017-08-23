require_relative 'subscription_type'

class Trip < ActiveRecord::Base

  belongs_to :start_station, class_name: "Station"
  belongs_to :end_station, class_name: "Station"
  belongs_to :subscription_type

  validates :duration, presence: true
  validates :start_date, presence: true
  validates :start_station_id, presence: true
  validates :end_date, presence: true
  validates :end_station_id, presence: true
  validates :bike_id, presence: true
  validates :subscription_type, presence: true

  def self.convert_csv_to_trip_attributes
    a = Time.now
    trips = []
    CSV.foreach("db/csv/trip_fixture.csv", {headers: true, header_converters: :symbol}) do |row|
      row[:zip_code] = 0 if row[:zip_code].to_s.length != 5
      trips << Trip.new(duration:            row[:duration],
                        start_date:          Date.strptime(row[:start_date], '%m/%e/%Y'),
                        start_station_id:    row[:start_station_id],
                        end_date:            Date.strptime(row[:end_date], '%m/%e/%Y'),
                        end_station_id:      row[:end_station_id],
                        bike_id:             row[:bike_id],
                        subscription_type:   SubscriptionType.where(subscription_type: row[:subscription_type]).first_or_create,
                        zip_code:            row[:zip_code])
    end
    b = Time.now
    puts "Creating the trips array took #{b - a} seconds"
    trips
  end

  def self.average_duration
    secs = Trip.average(:duration).to_i
    (secs / 60)
  end

  def self.longest_ride
    secs = Trip.maximum(:duration).to_i
    (secs / 60)
  end

  def self.shortest_ride
    secs = Trip.minimum(:duration).to_i
    (secs / 60)
  end

  def self.station_with_most_rides_as_starting_point
    Station.find(Trip.group(:start_station_id).order('count(*)').pluck(:start_station_id).last)
  end

  def self.station_with_the_most_rides_as_end_point
    Station.find(Trip.group(:end_station_id).order('count(*)').pluck(:end_station_id).last)
  end

  def self.chart_it_brah
    Trip.group_by_month(:start_date).count
  end

  def self.most_ridden_bike_id
    id = Trip.group('bike_id').order("count(*)").pluck(:bike_id).last
    Trip.get_bike_trip_count(id)
  end

  def self.get_bike_trip_count(id)
    b = Trip.group('bike_id').order('count(*)').count[id]
    "bike ##{id}, with #{b} rides."
  end

  def self.least_ridden_bike_id
    id = Trip.group('bike_id').order('count(*)').pluck(:bike_id).first
    Trip.get_bike_trip_count(id)
  end

  def self.highest_date
    date = Trip.group('start_date').order("count(*)").pluck(:start_date).last
    Trip.get_bike_trips_by_date(date)
  end

  def self.get_bike_trips_by_date(date)
    b = Trip.group('start_date').order('count(*)').count[date]
    "#{date}, there were #{b} rides."
  end

  def self.lowest_date
    date = Trip.group('start_date').order("count(*)").pluck(:start_date).first
    Trip.get_bike_trips_by_date(date)
  end

  def self.most_used_sub_type
    SubscriptionType.find(group(:subscription_type_id).order("count(*)").pluck(:subscription_type_id).last)
  end

  def self.get_sub_count(sub_type)
    b = Trip.group(:subscription_type_id).order('count(*)')
    total = Trip.all.count
    "There are #{b} #{sub_type} subscriptions, which accounts for #{((b.to_f / total.to_f) * 100).round(2)} percent of the total."
  end

  def self.least_used_sub_type
    SubscriptionType.find(group(:subscription_type_id).order("count(*)").pluck(:subscription_type_id).first)
  end

  def self.most_trips_go_to(station_id)
    where(start_station_id: station_id).group(:end_station_id).order('count(*)').pluck(:end_station_id).last
  end

  def self.most_trips_come_from(station_id)
    where(end_station_id: station_id).group(:start_station_id).order('count(*)').pluck(:start_station_id).last
  end

  def self.find_record_date(station_id)
    where(start_station_id: station_id).group(:start_date).order('count(*)').pluck(:start_date).last
  end

  def self.find_highest_zip(station_id)
    where(start_station_id: station_id).group(:zip_code).order('count(*)').pluck(:zip_code).last
  end

  def self.find_most_popular_bike(station_id)
    where(start_station_id: station_id).group(:bike_id).order('count(*)').pluck(:bike_id).last
  end
end
