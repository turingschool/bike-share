class Station < ActiveRecord::Base
  belongs_to :city
  belongs_to :trip

  validates :name, presence: true, uniqueness: true
  validates :dock_count, :city_id, :installation_date, presence: true

  def self.average_bikes_available
    average(:dock_count).round(2)
  end

  def self.most_bikes_at_a_station
    maximum(:dock_count)
  end

  def self.stations_with_most_bikes
    where("dock_count = ?", most_bikes_at_a_station)
  end

  def self.formatted_stations_with_most_bikes
    stations_with_most_bikes.pluck(:name).join(", ")
  end

  def self.least_bikes_at_a_station
    minimum(:dock_count)
  end

  def self.stations_with_least_bikes
    where("dock_count = ?", least_bikes_at_a_station)
  end

  def self.formatted_stations_with_least_bikes
    stations_with_least_bikes.pluck(:name).join(", ")
  end

  def self.most_recent_date
    maximum(:installation_date)
  end

  def self.most_recent_station
    where("installation_date = ?", most_recent_date)
  end

  def self.formatted_most_recent_station
    most_recent_station.pluck(:name).join(", ")
  end

  def self.oldest_date
    minimum(:installation_date)
  end

  def self.oldest_station
    where("installation_date = ?", oldest_date)
  end

  def self.formatted_oldest_station
    oldest_station.pluck(:name).join(", ")
  end
end
