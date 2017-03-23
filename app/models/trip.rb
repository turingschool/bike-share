class Trip < ActiveRecord::Base
  belongs_to :start_station, class_name: 'Station', foreign_key: :start_station_id
  belongs_to :end_station, class_name: 'Station', foreign_key: :end_station_id

  belongs_to :bike
  belongs_to :zip_code
  belongs_to :subscription_type

  belongs_to :condition 

  validates :duration, presence: true
  validates :start_date, presence: true
  validates :start_station_id, presence: true
  validates :end_date, presence: true
  validates :end_station_id, presence: true
  validates :bike_id, presence: true
  validates :subscription_type_id, presence: true

  def self.average_duration
    average(:duration).round(2)
  end

  def self.longest_trip
    Trip.find_by(duration: maximum(:duration))
  end

  def self.shortest_trip
    Trip.find_by(duration: minimum(:duration))
  end

  def self.starting_station_count
    Trip.group(:start_station_id).count(:id)
  end

  def self.most_popular_start_station_id
    starting_station_count.max_by{ |k, v| v }.first
  end

  def self.name_popular_starting_station
    Station.find(most_popular_start_station_id).name
  end

  def self.ending_station_count
    Trip.group(:end_station_id).count(:id)
  end

  def self.most_popular_end_station_id
    ending_station_count.max_by{ |k, v| v }.first
  end

  def self.name_popular_ending_station
    Station.find(most_popular_end_station_id).name
  end

  def self.years
    [2013, 2014, 2015]
  end

  def self.month_hash
    {1 => "January",
     2 => "February",
     3 => "March",
     4 => "April",
     5 => "May",
     6 => "June",
     7 => "July",
     8 => "August",
     9 => "September",
     10 => "October",
     11 => "November",
     12 => "December"}
  end

  def self.get_monthly_count(trips, month)
    trips.where('extract(month FROM start_date) = ?', month)
      .count
  end

  def self.monthly_totals
    total = {}
    years.each do |year|
      trips = where('extract(year FROM start_date) = ?', year)
      year_total = {}
      month_hash.each do |k,v|
        year_total[v] = get_monthly_count(trips, k)
      end
      total[year] = year_total
    end
    total
  end

  def self.bike_ride_counts
    counts = Trip.group(:bike_id).count(:id)
  end

  def self.find_most_ridden_bike
    bike_ride_counts.max_by{ |k, v| v }
  end

  def self.most_ridden_bike_id
    find_most_ridden_bike.first
  end

  def self.most_ridden_bike_count
    find_most_ridden_bike.last
  end

  def self.most_popular_bike
    Bike.find(most_ridden_bike_id).bike_number
  end

  def self.find_least_ridden_bike
    bike_ride_counts.min_by{ |k, v| v}
  end

  def self.least_ridden_bike_id
    find_least_ridden_bike.first
  end

  def self.least_popular_bike_count
    find_least_ridden_bike.last
  end

  def self.least_popular_bike
    Bike.find(least_ridden_bike_id).bike_number
  end

  def self.group_subscription_types
    Trip.group(:subscription_type_id).count(:id)
  end

  def self.one_count
    group_subscription_types[1]
  end

  def self.one_percentage
    ((one_count / Trip.count.to_f) * 100).round(2)
  end

  def self.two_count
    group_subscription_types[2]
  end

  def self.two_percentage
    ((two_count / Trip.count.to_f) * 100).round(2)
  end

  def self.one_subscription_type
    SubscriptionType.find_by(id: 1).subscription_type
  end

  def self.two_subscription_type
    SubscriptionType.find_by(id: 2).subscription_type
  end

  def self.subscription_breakdown
    "#{one_subscription_type}: #{one_percentage}% (#{one_count}) #{two_subscription_type}: #{two_percentage}% (#{two_count})"
  end

  def self.trips_per_day_count
    Trip.group(:start_date).count(:id)
  end

  def self.max_trips_per_day
    trips_per_day_count.max_by{ |k, v| v}
  end

  def self.busiest_day_count
    max_trips_per_day.last
  end

  def self.busiest_day_date
    max_trips_per_day.first
  end

  def self.busiest_day
    "#{busiest_day_date} - #{busiest_day_count} trip(s)"
  end

  def self.min_trips_per_day
    trips_per_day_count.min_by{ |k, v| v}
  end

  def self.least_busy_day_count
    min_trips_per_day.last
  end

  def self.least_busy_day_date
    min_trips_per_day.first
  end

  def self.least_busy_day
    "#{least_busy_day_date} - #{least_busy_day_count} trip(s)"
  end

end