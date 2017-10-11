class Station < ActiveRecord::Base
  validates_presence_of :name, :dock_count, :city, :installation_date
  validates :name, uniqueness: { scope: :dock_count }

  def self.average_available_bikes
    average(:dock_count)
  end

  def self.maximum_by_bikes
    maximum(:dock_count)
  end

  def self.stations_with_max_bikes
    where(dock_count: maximum_by_bikes).map { |station| station.name }
  end

  def self.minimum_by_bikes
    minimum(:dock_count)
  end

  def self.stations_with_min_bikes
    where(dock_count: minimum_by_bikes).map { |station| station.name }
  end

  def self.most_recently_installed
    max = maximum(:installation_date)
    where(installation_date: max).map { |station| station.name }
  end

  def self.earliest_installed
    min = minimum(:installation_date)
    where(installation_date: min).map { |station| station.name }
  end

  def start_ride_count
    Trip.where(start_station_id: station_id).count
  end

  def end_ride_count
    Trip.where(end_station_id: station_id).count
  end

  def most_frequent_destination
    trips = Trip.where(start_station_id: station_id)
    return "N/A" if trips.empty?
    station = trips.group(:end_station_id).order("count_all DESC").limit(1).count
    Station.find_by(station_id: station.keys.first).name
  end

  def most_frequent_origin
    trips = Trip.where(end_station_id: station_id)
    return "N/A" if trips.empty?
    station = trips.group(:start_station_id).order("count_all DESC").limit(1).count
    Station.find_by(station_id: station.keys.first).name
  end

  def most_popular_date
    trips = Trip.where(start_station_id: station_id)
    return "N/A" if trips.empty?
    date = trips.group(:start_date).order("count_all DESC").limit(1).count.keys.first
    date.strftime("%B %d, %Y")
  end

  def most_popular_zip
    trips = Trip.where(start_station_id: station_id)
    return "N/A" if trips.empty?
    trips.group(:zip_code).order("count_all DESC").limit(1).count.keys.first
  end

  def most_frequent_bike_id
    trips = Trip.where(start_station_id: station_id)
    return "N/A" if trips.empty?
    trips.group(:bike_id).order("count_all DESC").limit(1).count.keys.first
  end
end
