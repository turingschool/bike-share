class Trip < ActiveRecord::Base
  belongs_to :station
  belongs_to :subscription_type
  belongs_to :bike

  validates :duration, presence: true
  validates :start_date, presence: true
  # validates :start_station_name, presence: true
  validates :end_date, presence: true
  # validates :end_station_name, presence: true
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
    starting_station_ids = Trip.pluck(:start_station_id)
    most_popular_start_stations = starting_station_ids.group_by { |id| starting_station_ids.count(id) }.max.last.uniq
    Station.find(most_popular_start_stations).map{|station| station.name }.sort
  end

  def self.most_end_station
    ending_station_ids = Trip.pluck(:end_station_id)
    most_popular_end_stations = ending_station_ids.group_by { |id| ending_station_ids.count(id) }.min.last.uniq
    Station.find(most_popular_end_stations).map{|station| station.name }.sort
  end

  def self.monthly_totals
    monthly_totals = {}
    Trip.all.each do |trip|
      year = trip.start_date.year.to_i
      monthly_totals[year] ||= Array.new(12, 0)
      month = trip.start_date.month
      monthly_totals[year][month - 1] += 1
    end
    monthly_totals
  end

end
