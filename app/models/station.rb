class Station < ActiveRecord::Base
  validates :name, presence: true
  validates :city, presence: true
  validates :installation_date, presence: true
  validates :dock_count, presence: true

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

  def self.average_bike_available_per_station
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
end
