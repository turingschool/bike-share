require 'date'

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

  def self.determine_trips_on_specific_dates(date_range)
    where('Date(start_date) IN (?)', date_range)
  end

  def self.average_duration
    Trip.average(:duration).to_i
  end

  def self.longest_ride
    Trip.maximum(:duration)
  end

  def self.shortest_ride
    Trip.minimum(:duration)
  end

  def self.starting_station_most_rides
    (Station.find_by(id: (Trip.group(:start_station_id)).order('count_id DESC').count(:id).first)).name
  end

  def self.ending_station_most_rides
    (Station.find_by(id: (Trip.group(:end_station_id)).order('count_id DESC').count(:id).first)).name
  end

  def self.monthly_breakdown_of_rides(year, month)
    Trip.where('extract(year from start_date)=?', year).where('extract(month from start_date)=?', month).count
  end

  def self.most_ridden_bike_id
    Trip.group(:bike_id).count.max_by{|bike, count| count}[0]
  end

  def self.most_ridden_bike_rides
    Trip.group(:bike_id).count.max_by{|bike, count| count}[1]
  end

  def self.least_ridden_bike_id
    Trip.group(:bike_id).count.min_by{|bike, count| count}[0]
  end

  def self.least_ridden_bike_rides
    Trip.group(:bike_id).count.min_by{|bike, count| count}[1]
  end

  def self.customer_subscription_count
    Trip.group(:subscription_type).count["Customer"]
  end

  def self.subscriber_subscription_count
    Trip.group(:subscription_type).count["Subscriber"]
  end

  def self.customer_subscription_percentage
    customer_percentage = (customer_subscription_count.to_f / total_subscription_count) * 100
    customer_percentage.round(2)
  end

  def self.subscriber_subscription_percentage
    subscriber_percentage = (subscriber_subscription_count.to_f / total_subscription_count) * 100
    subscriber_percentage.round(2)
  end

  def self.total_subscription_count
    customer_subscription_count + subscriber_subscription_count
  end

  def self.highest_number_of_trips_date
    Trip.group('DATE(start_date)').count.max_by{|date, count| count}.first.strftime('%m/%d/%Y')
  end

  def self.highest_number_of_trips_total
    Trip.group('DATE(start_date)').count.max_by{|date, count| count}[1]
  end

  def self.lowest_number_of_trips_date
    Trip.group('DATE(start_date)').count.min_by{|date, count| count}.first.strftime('%m/%d/%Y')
  end

  def self.lowest_number_of_trips_total
    Trip.group('DATE(start_date)').count.min_by{|date, count| count}[1]
  end

  # SHOW STATION METHODS

  def self.rides_started_at_station(id)
    Trip.where(start_station_id: id).count
  end

  def self.rides_ended_at_station(id)
    Trip.where(end_station_id: id).count
  end


  def self.frequent_destination_station(id)
    (Trip.where(start_station_id: id).group(:end_station).count.max_by{|station, count| count}).first.name
  end

  def self.frequent_origination_station(id)
    (Trip.where(end_station_id: id).group(:start_station).count.max_by{|station, count| count}).first.name
  end

  def self.busiest_origination_date(id)
    Trip.where(start_station_id: id).group('DATE(start_date)').count.max_by{|date, count| count}.first.strftime('%m/%d/%Y')
  end

  def self.frequent_starting_user_zipcode(id)
    zip_id = Trip.where(start_station_id: id).group(:zipcode_id).count.max_by{|zip, count| count}
    Zipcode.find_by(id: zip_id).zipcode
  end

  def self.frequent_origin_bike_id(id)
    (Trip.where(start_station_id: id).group(:bike_id).count.max_by{|bike, count| count}).first
  end

  def self.all_pages
    (Trip.count / 30.0).ceil
  end

  def self.paginate(page)
    offset = ( page - 1 ) * 30
    Trip.limit(30).offset(offset)
  end
end
