require 'pry'

class Trip < ActiveRecord::Base
  validates :duration, :start_date, :start_station_id, :end_date, :end_station_id, :bike_id, :subscription_type, presence: true

  belongs_to :start_station, :class_name => "Station"
  belongs_to :end_station, :class_name => "Station"

  def self.get_first_30
    all_trips = Trip.order(:start_date)
    first_30_trips = []
    30.times do |number|
      first_30_trips << all_trips[number] unless all_trips[number].nil?
    end
    first_30_trips
  end

  #Trips Dashboard methods for Info

  def self.average_duration_of_a_ride
    average(:duration).to_i
  end

  def self.longest_ride
    maximum(:duration).to_i
  end

  def self.shortest_ride
    minimum(:duration).to_i
  end

  def self.station_with_most_starting_place_rides
    group(:start_station).count("id").max_by do |station, count|
      station
    end
  end

  def self.station_with_most_ending_place_rides
    group(:end_station).count("id").max_by do |station, count|
      station
    end
  end


  # TODO: CONVERT DATE TO DATETYPE NOT STRING
  # def self.month_by_month_breakdown_with_subtotals_by_year
  #   trips = where('start_date')
  #   breakdown = trips.group(:start_date).count
  #   breakdown[:total] = breakdown.values.reduce(:+)
  # end

  def self.most_ridden_bike
    group(:bike_id).order('count_id DESC').limit(1).count(:id)
  end

  def self.least_ridden_bike
    group(:bike_id).order('count_id ASC').limit(1).count(:id)
  end

  def self.user_subscription_type_count
    output = {}
    output[:customers] = where(subscription_type: "customer").count
    output[:subscribers] = where(subscription_type: "subscriber").count

    output[:customers_percentage] = ((output[:customers].to_f / count) * 100).round(2)
    output[:subscribers_percentage]  = ((output[:subscribers].to_f / count) * 100).round(2)
    output
  end

  def self.busiest_day
    group(:start_date).count("id").max_by{|date, count| count }
  end

  def self.least_busy_day
    group(:end_date).count("id").min_by{|date, count| count }
  end

  #Individual station methods for Info
  # For these, edit them so they look up the info of a provided station_id

  def self.number_of_rides_started_at_station(station_id)
    where(start_station_id: station_id).count
  end

  def self.number_of_rides_ended_at_station(station_id)
    where(end_station_id: station_id).count
  end

  def self.most_frequent_starting_station
    group(:start_station).count("id").max_by{|station, count| count }
  end

  def self.most_frequent_ending_station
    group(:end_station).count("id").max_by{|station, count| count }
  end

  def self.highest_number_of_trips_of_stations_by_date
    date = where(start_station_id: id).group(:start_date).count("id")
    highest_date = date.max_by { |date, count| date}
  end

  def self.most_frequesnt_zip_code_for_starting_station
    zipcode = where(start_station_id: id).group(:zip_code).count("id")
    highest_zip_code = zipcode.max_by { |zipcode, count| zipcode}
  end

  def self.most_frequenst_bike_id_for_starting_station
    bike = where(start_station_id: id).group(:bike_id).count("id")
    highest_bike = bike.max_by { |bike, count| bike}
  end

end
