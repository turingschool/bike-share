class Station < ActiveRecord::Base
  belongs_to :city

  validates :name, presence: true, uniqueness: true
  validates :dock_count, :installation_date, presence: true

  def self.total_stations
    Station.count
  end

  def self.average_bikes_per_station
    Station.average(:dock_count)
  end

  def self.most_bikes_available_at_station
    Station.maximum(:dock_count)
  end

  def self.stations_where_the_most_bikes_are_available
    most_bikes_station_names = Station.where(dock_count: (Station.most_bikes_available_at_station))

    most_bikes_station_names.map { |station| station.name }
  end

  def self.fewest_bikes_available_at_station
    Station.minimum(:dock_count)
  end

  def self.stations_where_the_fewest_bikes_are_available
    fewest_bikes_station_names = Station.where(dock_count: (Station.fewest_bikes_available_at_station))

    fewest_bikes_station_names.map { |station| station.name }
  end

end
