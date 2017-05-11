class Trip < ActiveRecord::Base
  belongs_to :subscription_type

  belongs_to :start_station, :class_name => 'Station'
  belongs_to :end_station, :class_name => 'Station'

  validates :duration, presence: true
  validates :start_date, presence: true
  validates :start_station_id, presence: true
  validates :end_date, presence: true
  validates :end_station_id, presence: true
  validates :bike_id, presence: true
  validates :subscription_type_id, presence: true
  validates :zip_code, presence: true

  validates :zip_code, numericality: { greater_than: 10000, less_than: 999999, only_integer: true }

  def self.order_by_date
    self.order(:start_date).reverse
  end

  def self.average_ride_duration
    (self.sum(:duration) / self.count).to_i
  end

  def self.longest_ride
     self.maximum(:duration)
  end

  def self.shortest_ride
    self.minimum(:duration)
  end

  def self.station_with_most_rides_start_station_id
    id = Trip.group(:start_station_id).count.max_by{|k,v| v}.first
    Station.find(id).name
  end

  def self.station_with_most_rides_end_station_id
    id = Trip.group(:end_station_id).count.max_by{|k,v| v}.first
    Station.find(id).name
  end

  def self.bike_with_most_rides
    Trip.group(:bike_id).count.max_by{|k,v| v}.first
  end

  def self.most_number_of_rides
    Trip.group(:bike_id).count.max_by{|k,v| v}.last
  end

  def self.bike_with_least_rides
    Trip.group(:bike_id).count.min_by{|k,v| v}.first
  end

  def self.least_number_of_rides
    Trip.group(:bike_id).count.min_by{|k,v| v}.last
  end

  def self.date_with_highest_trips
    Trip.group(:start_date).count.max_by{|k,v| v}.first
  end

  def self.date_with_lowest_trips
    Trip.group(:start_date).count.min_by{|k,v| v}.first
  end

  def self.number_of_rides_started_at_station(station_id)
    Trip.where(start_station_id: station_id).count
  end

  def self.number_of_rides_ended_at_station(station_id)
    Trip.where(end_station_id: station_id).count
  end

  def self.most_frequent_destination_for_station(station_id)
    Trip.where('start_station_id = ?', station_id).group(:end_station).order('count_end_station_id DESC').count(:end_station_id).first.first.name
  end

  def self.most_frequent_origin_for_station(station_id)
    Trip.where('end_station_id = ?', station_id).group(:start_station).order('count_start_station_id ASC').count(:start_station_id).first.first.name
  end

  def self.highest_trips_by_date_for_station(station_id)
    date = Trip.where('start_station_id = ?', station_id).group(:start_date).order('count_start_date DESC').count(:start_date).first
    {date: date[0], frequency: date[1]}
  end

  def self.most_frequent_zipcode_for_start_station(station_id)
    zip_code = Trip.where('start_station_id = ?', station_id).group(:zip_code).order('count_zip_code DESC').count(:zip_code).first
    {zip_code: zip_code[0], frequency: zip_code[1]}
  end

  def self.most_frequent_bike_id_for_start_station(station_id)
    bike_id = Trip.where('start_station_id = ?', station_id).group(:bike_id).order('count_bike_id DESC').count(:bike_id).first
    {bike_id: bike_id[0], frequency: bike_id[1]}
  end

  def self.get_month_set
    Trip.all.map do |trip|
      trip.start_date.strftime("%B/%y")
    end
  end

  def self.get_year_set
    Trip.all.map do |trip|
      trip.start_date.strftime("%y")
    end
  end

  def self.month_by_month_breakdown(month_set)
    month_counts = Hash.new(0)
    month_set.each do |month|
      month_counts[month] += 1
    end
    month_counts
  end

  def self.year_subtotals(year_set)
    year_counts = Hash.new(0)
    year_set.each do |year|
      year_counts[year] += 1
    end
    year_counts
  end
end
