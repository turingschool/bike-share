require 'pry'
require 'time'
require 'date'

class Station < ActiveRecord::Base
  belongs_to :city

  has_many :start_trips, class_name: 'Trip', foreign_key: :start_station_id
  has_many :end_trips, class_name: 'Trip', foreign_key: :end_station_id

  validates :name, presence: true, uniqueness: true
  validates :dock_count, presence: true
  validates :city_id, presence: true
  validates :installation_date, presence: true

  def self.total_stations
    Station.all.count
  end

  def self.dock_counts
    Station.all.map(&:dock_count)
  end

  def self.average_bikes
    dock_counts.reduce(:+) / total_stations
  end

  def self.most_bikes
    dock_counts.max
  end

  def self.list_maker(station_list)
    if station_list.count == 0
      "No Stations Available"
    elsif station_list.count == 1
      station_list.first.name
    else
      output = station_list.reduce("") do |sum, station|
          sum + station.name + ", "
      end
      output[0..-3]
    end
  end

  def self.stations_with_most_bikes
    list_maker(Station.where(dock_count: most_bikes.to_s))
  end

  def self.fewest_bikes
    dock_counts.min
  end

  def self.stations_with_fewest_bikes
    list_maker(Station.where(dock_count: fewest_bikes.to_s))
  end

  def self.date_converter(string_date)
    DateTime.strptime(string_date, "%m/%d/%Y")
  end

  def self.install_dates
    Station.all.map do |station|
      date_converter(station.installation_date)
    end
  end

  def self.date_finder(picker)
    Station.all.find_all do |station|
      date_converter(station.installation_date) == picker
    end
  end

  def self.newest_stations
    list_maker(date_finder(install_dates.max))
  end

  def self.oldest_stations
    list_maker(date_finder(install_dates.min))
  end

end
