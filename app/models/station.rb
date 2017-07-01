class Station < ActiveRecord::Base
  validates_presence_of :name, :dock_count, :installation_date, :city_id
  belongs_to :cities

  def self.most_bikes
    Station.maximum("dock_count")
  end

  def self.stations_with_most_bikes
    Station.where(dock_count: Station.most_bikes).pluck("name").join(" ~ ")
  end

  def self.least_bikes
    Station.minimum("dock_count")
  end

  def self.stations_with_least_bikes
    Station.where(dock_count: Station.least_bikes).pluck("name")
  end

  def self.newest_stations
    newest_date = Station.maximum("installation_date")
    Station.where(installation_date: newest_date).pluck("name").join(" ~ ")
  end

  def self.oldest_stations
    oldest_date = Station.minimum("installation_date")
    Station.where(installation_date: oldest_date).pluck("name").join(" ~ ")
  end

end
