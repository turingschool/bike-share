require './app/models/trip'

class Station < ActiveRecord::Base
  validates :name, presence: true
  validates :city, presence: true
  validates :installation_date, presence: true
  validates :dock_count, presence: true
  has_many :start_trips, class_name: "Trip", foreign_key: "start_station_id"
  has_many :end_trips, class_name: "Trip", foreign_key: "end_station_id"

  def self.most_recent_installation_date
    self.maximum(:installation_date)
  end

  def self.oldest_installation_date
    self.minimum(:installation_date)
  end

  def self.oldest_station
    self.where(installation_date: oldest_installation_date).first
  end

  def self.newest_station
    self.where(installation_date: most_recent_installation_date).first
  end

  def self.average_bikes_available_per_station
    self.average(:dock_count).round
  end

  def self.maximum_dock_count
    self.maximum(:dock_count)
  end

  def self.station_with_maximum_dock_count
    self.where(dock_count: maximum_dock_count)
  end

  def self.minimum_dock_count
    self.minimum(:dock_count)
  end

  def self.station_with_minimum_dock_count
    self.where(dock_count: minimum_dock_count)
  end

  def self.id_by_name(name)
    name = "Stanford in Redwood City" if name == "Broadway at Main"
    name = "Santa Clara County Civic Center" if name == "San Jose Government Center"
    name = "Post at Kearney" if name == "Post at Kearny"
    name = "Washington at Kearney" if name == "Washington at Kearny"
    find_by(name: name).id
  end

  def self.most_popular_starting_station
    Trip.group(:start_station).order("count_id DESC").count(:id).keys.first.name
  end

  def self.most_popular_ending_station
    Trip.group(:end_station).order("count_id DESC").count(:id).keys.first.name
  end

  def number_of_rides_started_here
    self.start_trips.count
  end

  def number_of_rides_ended_here
    self.end_trips.count
  end
end
