
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

  def date_with_most_trips(station_id)
    trips = Trip.where(start_station_id: station_id)
    date = trips.group(:start_date).order("count_id DESC").limit(1).count(:id).keys.first # if you .to_date this is returns just the date but in a different format
    date.to_date
  end

  def most_frequent_zip_code_for_users(station_id)
    trips = Trip.where(start_station_id: station_id)
    zip_code = trips.group(:zip_code).order("count_id DESC").count(:id).keys.first
  end

  def most_common_bike_id(station_id)
    trips = Trip.where(start_station_id: station_id)
    bike_id = trips.group(:bike_id).order("count_id DESC").count(:id).keys.first
  end

end
