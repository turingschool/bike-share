class Station < ActiveRecord::Base

  belongs_to :city
  has_many :trips

  has_many :start_trips, class_name: 'Trip', foreign_key: :start_station_id
  has_many :end_trips, class_name: 'Trip', foreign_key: :end_station_id

  validates :name, presence: true, uniqueness: true
  validates :dock_count, presence: true
  validates :installation_date, presence: true
  validates :lat, presence: true
  validates :long, presence: true

  def self.total
    Station.count
  end

  def self.find_average_docks
    docks = Station.all.reduce(0) do |memo, num|
      memo += num.dock_count
    end

    docks / Station.count
  end

  def self.max_dock_count
    station = Station.all.max_by do |station|
      station.dock_count
    end

    station.dock_count
  end

  def self.stations_with_most_docks
    max_docks = self.max_dock_count

    Station.all.select do |station|
      station.dock_count == max_docks
    end
  end

  def self.min_dock_count
    station = Station.all.min_by do |station|
      station.dock_count
    end

    station.dock_count
  end

  def self.stations_with_fewest_docks
    min_docks = self.min_dock_count

    Station.all.select do |station|
      station.dock_count == min_docks
    end
  end

  def self.oldest_date
    Station.all.min_by do |station|
      station.installation_date
    end.installation_date
  end

  def self.oldest_stations
    Station.all.select do |station|
      station.installation_date == self.oldest_date
    end
  end

  def self.newest_date
    Station.all.max_by do |station|
      station.installation_date
    end.installation_date
  end

  def self.newest_stations
    Station.all.select do |station|
      station.installation_date == self.newest_date
    end
  end
end
