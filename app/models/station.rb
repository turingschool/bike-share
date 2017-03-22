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
    Station.count
  end

  def self.average_bikes
    Station.average(:dock_count).to_i
  end

  def self.most_bikes
    Station.maximum(:dock_count)
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
    list_maker(Station.where(dock_count: most_bikes))
  end

  def self.fewest_bikes
    Station.minimum(:dock_count)
  end

  def self.stations_with_fewest_bikes
    list_maker(Station.where(dock_count: fewest_bikes))
  end

  def self.newest_installation_date
    Station.maximum(:installation_date)
  end

  def self.newest_stations
    list_maker(Station.where(installation_date: newest_installation_date))
  end

  def self.oldest_installation_date
    Station.minimum(:installation_date)
  end

  def self.oldest_stations
    list_maker(Station.where(installation_date: oldest_installation_date))
  end

  def self.create_station(params)
    Station.create(
      name: params[:station][:name],
      dock_count: params[:station][:dock_count],
      city: City.find_or_create_by(name: params[:station][:city]),
      installation_date: params[:station][:installation_date]
    )
  end

  def self.update_station(params)
    Station.find(params[:id]).update(
      name: params[:station][:name],
      dock_count: params[:station][:dock_count],
      city: City.find_or_create_by(name: params[:station][:city]),
      installation_date: params[:station][:installation_date]
    )
  end
  
  def self.start_station_with_most_rides
    Station.all.max_by {|station| station.start_trips.count}
  end
  
  def self.end_station_with_most_rides
    Station.all.max_by {|station| station.end_trips.count}
  end

end
