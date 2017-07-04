class Station < ActiveRecord::Base
  validates_presence_of :name, :city, :dock_count, :installation_date_id
  belongs_to :installation_date, class_name: "BikeShareDate", foreign_key: "installation_date_id"
  has_many :start_trips, class_name: "Trip", foreign_key: "start_station_id"
  has_many :end_trips, class_name: "Trip", foreign_key: "end_station_id"

  def self.id_by_name(name)
    name = "Stanford in Redwood City" if name == "Broadway at Main"
    name = "Santa Clara County Civic Center" if name == "San Jose Government Center"
    name = "Post at Kearney" if name == "Post at Kearny"
    name = "Washington at Kearney" if name == "Washington at Kearny"
    find_by(name: name).id
  end

  def self.total_count
    Station.count
  end

  def self.most_number_of_available_bikes
    Station.pluck(:dock_count).max
  end

  def self.least_number_of_available_bikes
    Station.pluck(:dock_count).min
  end

  def self.oldest_station
    Station.includes(:installation_date).order('bike_share_dates.date').first
  end

  def self.station_with_most_bikes
    most_bikes = Station.maximum(:dock_count)
    Station.where(dock_count: most_bikes)
  end

  def self.average_bikes_available_per_station
    average(:dock_count).round
  end

  def self.most_recently_installed
    Station.includes(:installation_date).order('bike_share_dates.date').last
  end

  def self.stations_with_fewest_bikes_available
    station = Station.minimum(:dock_count)
    Station.where(dock_count: station)
  end

  def most_trip_date
    #Need total rides by station by day
  end
end
