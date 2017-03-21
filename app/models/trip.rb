class Trip < ActiveRecord::Base
  belongs_to :station

  validates :duration, presence: true
  validates :start_date, presence: true
  # validates :start_station_name, presence: true
  validates :end_date, presence: true
  # validates :end_station_name, presence: true
  validates :bike_id, presence: true
  validates :subscription_type, presence: true

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

#did not consider if there is a tie
  def self.most_end_station
    trips = Trip.all.map do |trip|
      trip.end_station_id
    end
    Station.find(trips.group_by(&:itself).values.max_by(&:size).first).name
  end




  def self.monthly_totals
    monthly_totals = {}
    Trip.all.each do |trip|
      # Find the year of the trip
      year = trip.start_date.year.to_s
      monthly_totals[year] ||= Array.new(12, 0)
      # require "pry"; binding.pry
      # Find the month of the trip
      month = trip.start_date.month
      monthly_totals[year][month] += 1
    end
    monthly_totals
  end

end
