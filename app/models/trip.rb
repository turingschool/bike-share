class Trip < ActiveRecord::Base
  default_scope { order(start_date: :desc) }
  # scope :ordered_by_title, -> { order(title: :asc) }

  belongs_to :start_station, class_name: 'Station', foreign_key: :start_station_id
  belongs_to :end_station, class_name: 'Station', foreign_key: :end_station_id
  belongs_to :end_station, class_name: 'Station'
  belongs_to :subscription_type
  belongs_to :bike
  belongs_to :condition

  validates :duration, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :start_station_id, presence: true
  validates :end_station_id, presence: true
  validates :bike_id, presence: true
  validates :subscription_type_id, presence: true


  def self.average_trip_duration
    average(:duration).round
  end

  def self.longest_ride
    maximum(:duration)
  end

  def self.shortest_ride
    minimum(:duration)
  end

  def self.most_start_station
    starting_station_ids = pluck(:start_station_id)
    most_popular_start_stations = starting_station_ids.group_by { |id| starting_station_ids.count(id) }.max.last.uniq
    Station.find(most_popular_start_stations).map{|station| station.name }.sort
  end

  def self.most_end_station
    ending_station_ids = pluck(:end_station_id)
    most_popular_end_stations = ending_station_ids.group_by { |id| ending_station_ids.count(id) }.min.last.uniq
    Station.find(most_popular_end_stations).map{|station| station.name }.sort
  end

  def self.monthly_totals
    monthly_totals = {}
    all.each do |trip|
      year = trip.start_date.year.to_i
      monthly_totals[year] ||= Array.new(12, 0)
      month = trip.start_date.month
      monthly_totals[year][month - 1] += 1
    end
    monthly_totals
  end

  def self.started_at(station)
    where(start_station_id: station)
  end

  def self.ended_at(station)
    where(end_station_id: station)
  end

  def self.number_by_date_hash
    start_dates = pluck(:start_date)
    start_dates.group_by { |start_date| start_dates.count(start_date)}
  end

  # def self.highest_number_trips_date
  #   start_dates = pluck(:start_date)
  #   start_dates.group_by { |start_date| start_dates.count(start_date)}
  # end

  def self.highest_number_trips_date
    number_by_date_hash.max.last.uniq
  end

  def self.most_trips_date_count
    number_by_date_hash.max.first
  end

  def self.fewest_number_trips_date
    number_by_date_hash.min.last.uniq
  end

  def self.fewest_trips_date_count
    number_by_date_hash.min.first
  end

end
