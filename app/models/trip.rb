class Trip < ActiveRecord::Base
  belongs_to :start_station, class_name: 'Station', foreign_key: :start_station_id
  belongs_to :end_station, class_name: 'Station', foreign_key: :end_station_id

  belongs_to :bike
  belongs_to :zip_code
  belongs_to :subscription_type

  validates :duration, presence: true
  validates :start_date, presence: true
  validates :start_station_id, presence: true
  validates :end_date, presence: true
  validates :end_station_id, presence: true
  validates :bike_id, presence: true
  validates :subscription_type_id, presence: true

  def self.average_duration
    average(:duration)
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

  # group trips by year
  # within each year, group trips by month
  # each month has number of trips

  # {year => {month => trip_count, month => trip_count}}


  def self.select_years
    years={}
    years[2013] = Trip.where('extract(year from start_date) = ?', 2013)
    years[2014] = Trip.where('extract(year from start_date) = ?', 2014)
    years
  end
  # years[2014].group_by_month(:start_date, format: "%b %Y").count


  def self.select_months(years_hash)
    years_hash.each do |k, v|
    end
  end

  def self.rides_by_month
    month_totals={}
    month_totals[2013] = select_years[2013].group_by_month(:start_date, format: "%b %Y").count
    month_totals[2014] = select_years[2014].group_by_month(:start_date, format: "%b %Y").count
    month_totals
    # require 'pry'; binding.pry
  end

#    month_totals
# => {2013=>{"Apr 2013"=>1}, 2014=>{"Apr 2014"=>2}}
# [5] pry(Trip)> month_totals[2013].each do |k, v|
# [5] pry(Trip)*   puts k
# [5] pry(Trip)*   puts v
# [5] pry(Trip)* end  

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

end