class Trip < ActiveRecord::Base
  validates :duration, presence: true
  validates :start_date, presence: true
  validates :start_station_id, presence: true
  validates :end_date, presence: true
  validates :end_station_id, presence: true
  validates :bike_id, presence: true
  validates :subscription_type, presence: true
  belongs_to :station

  def self.average_duration_of_ride
    Trip.average(:duration)
  end

  def self.longest_ride
    Trip.maximum(:duration)
  end

  def self.shortest_ride
    Trip.minimum(:duration)
  end

  def self.station_with_most_rides_as_starting_place
    station = Trip.group(:start_station_id).order("count_id DESC").limit(1).count(:id)
    Station.find(station.keys.first)
  end

  def self.station_with_most_rides_as_ending_place
    station = Trip.group(:end_station_id).order("count_id DESC").limit(1).count(:id)
    Station.find(station.keys.first)
  end

  def self.most_ridden_bike_with_total_number_of_rides
    bike = Trip.group(:bike_id).order("count_id DESC").count(:id)
    bike.keys
  end

  def self.least_ridden_bike_with_total_number_of_rides
    bike = Trip.group(:bike_id).order("count_id ASC").count(:id)
    bike.keys
  end

  def self.subscriber_count_and_percentage
    total = Trip.all.count.to_f
    subscription_type_total = Trip.group(:subscription_type).count
    subscriber_count = subscription_type_total.values[1]
    subscriber_percentage = (subscriber_count / total * 100).round(2)
    return "Subscribers total: #{subscriber_count} Percentage: #{subscriber_percentage}"
  end

  def self.customer_count_and_percentage
    total = Trip.all.count.to_f
    subscription_type_total = Trip.group(:subscription_type).count
    customer_count = subscription_type_total.values[0]
    customer_percentage = (customer_count / total * 100).round(2)
    return "Customers total: #{customer_count} Percentage: #{customer_percentage}"
  end

  def self.date_with_highest_number_of_trips # this returns the date and time, do we just want the date?
    date = Trip.group(:start_date).order("count_id DESC").limit(1).count(:id).keys.first # if you .to_date this is returns just the date but in a different format
    Trip.where(start_date: date).count
  end

  def self.date_with_lowest_number_of_trips
    date = Trip.group(:start_date).order("count_id ASC").limit(1).count(:id).keys.first
    Trip.where(start_date: date).count
  end

  def self.month_by_month_breakdown
    start_year = 2013
    month = 1
    months = {}
    years= {}
    12.times do
      # binding.pry
      months[month] = where("extract(month from start_date) = ?", month).count
      month += 1
    end

    (Time.new.year - start_year).times do
      years[start_year] = where('extract(year from start_date) = ?', start_year).count
      start_year += 1
    end

    {months: months, years: years}
  end
end
