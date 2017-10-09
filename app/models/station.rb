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

  def most_popular_destination
    #of all trips starting at this station, where do they most
    trips = Trip.where(start_station_id: station_id)
    station = trips.group(:end_station_id).order("count_all DESC").limit(1).count
    Station.find_by(station_id: station.keys.first).name
  end

end
