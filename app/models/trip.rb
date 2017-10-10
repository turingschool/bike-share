class Trip < ActiveRecord::Base
  validates :duration,
            :start_date,
            :start_station_id,
            :end_date,
            :end_station_id,
            :bike_id,
            :subscription_type,
            :zip_code,
             presence: true

  belongs_to :start_station, :class_name => 'Station', :foreign_key => 'start_station_id'
  belongs_to :end_station,   :class_name => 'Station', :foreign_key => 'end_station_id'

  def self.average_duration
    average(:duration)
  end

  def self.longest_ride
    maximum(:duration)
  end

  def self.shortest_ride
    minimum(:duration)
  end

  def self.station_most_starting_rides
    station = group(:start_station_id).order("count_id DESC").count(:id).first[0]
    Station.find(station).name
  end

  def self.station_most_ending_rides
    station = group(:end_station_id).order("count_id DESC").count(:id).first[0]
    Station.find(station).name
  end

  def self.monthly_rides
    group("DATE_TRUNC('month', start_date)").order("DATE_TRUNC('month', start_date) ASC").count(:start_date)
  end

  def self.yearly_rides
    group("DATE_TRUNC('year', start_date)").order("DATE_TRUNC('year', start_date) ASC").count(:start_date)
  end

#returns an array of arrays, first element will be the month,
#second will be the year,
#third will be the amount of trips
  def self.parse_monthly_rides
    parse = monthly_rides.map do |date, trips|
      [Date::MONTHNAMES[date.month], date.year, trips]
    end
  end


#bike is the bike_id and trips is the number of trips
  def self.most_ridden_bike
    bike = group(:bike_id).order("count_id DESC").count(:id).first
    trips = bike[1]
    return bike[0], trips
  end

  def self.least_ridden_bike
    bike = group(:bike_id).order("count_id DESC").count(:id).last
    trips = bike[1]
    return bike[0], trips
  end

  def self.subscription_breakdown
    customer = group(:subscription_type).order("count_id ASC").count(:id).first
    subscriber = group(:subscription_type).order("count_id DESC").count(:id).first
    return customer, subscriber
  end

  def self.subscription_percentage
    total = subscription_breakdown[0][1] + subscription_breakdown[1][1]
    customer = ((subscription_breakdown[0][1].to_f / total) * 100).round
    subscriber = ((subscription_breakdown[1][1].to_f / total) * 100).round
    return customer, subscriber
  end

  def self.date_with_highest_trips
    date = group(:start_date).order("count_id DESC").count(:id).first
  end

  def self.date_with_lowest_trips
    date = group(:start_date).order("count_id ASC").count(:id).first
  end

  def self.rides_started(id)
    where(start_station_id: id).count
  end

  def self.rides_ended(id)
    where(end_station_id: id).count
  end

  def self.frequent_destination(id)
    trips = where(start_station_id: id)
    destination = trips.group(:end_station_id).order("count_id DESC").count(:id).first[0]
    Station.find(destination).name
  end

  def self.origin_destination(id)
    trips = where(start_station_id: id)
    destination = trips.group(:start_station_id).order("count_id DESC").count(:id).first[0]
    Station.find(destination).name
  end

  def self.busiest_date(id)
    trips = where(start_station_id: id)
    date = trips.group(:start_date).order("count(start_date) DESC").count(:start_date).first[0]
  end

  def self.frequent_zipcode(id)
    trips = where(start_station_id: id)
    zip_code = trips.group(:zip_code).order("count(zip_code) DESC").count(:zip_code).first[0]
  end

  def self.frequent_bike(id)
    trips = where(start_station_id: id)
    bike_id = trips.group(:bike_id).order("count(bike_id) DESC").count(:bike_id).first[0]
  end
end
