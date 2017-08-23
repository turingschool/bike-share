
class Station < ActiveRecord::Base
  validates :name, presence: true
  validates :city_id, presence: true
  validates :dock_count, presence: true
  validates :installation_date, presence: true
  belongs_to :city
  has_many :trips

  def self.average_per_station
    Station.average(:dock_count)
  end

  def self.most_bikes_available_at_station
    Station.maximum(:dock_count)
  end

  def self.stations_with_most_bikes
    Station.order(:dock_count).reverse_order
  end

  def self.least_bikes_available_at_station
    Station.minimum(:dock_count)
  end

  def self.stations_with_least_bikes
    Station.order(:dock_count)
  end

  def self.most_recent_installed_station
    Station.order(:installation_date).reverse_order.first
  end

  def self.oldest_station
    Station.order(:installation_date).first
  end

  def number_of_rides_started_at_this_station(station_id)
    stations = Trip.group(:start_station_id).count(:id)
    stations[station_id]
  end

  def number_of_rides_ended_at_this_station(station_id)
    stations = Trip.group(:end_station_id).count(:id)
    stations[station_id]
  end

  def most_frequent_destination_station(station_id)
    station = Trip.where(start_station_id: station_id).group(:end_station_id).order('count_id DESC').count(:id).first
    Station.find(station[0])[:name]
  end

  def most_frequent_origination_station(station_id)
    station = Trip.where(end_station_id: station_id).group(:start_station_id).order('count_id DESC').count(:id).first
    Station.find(station[0])[:name]
  end

end
