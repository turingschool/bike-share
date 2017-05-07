require 'pry'
class Station < ActiveRecord::Base
  validates :name, :dock_count, :city, :date, presence: true

  def self.total
    Station.all.count
  end

  def self.average_bikes
    Station.average(:dock_count).round
  end

  # Should we be returning the entire station obj or just the dock_count/name field?
  def self.most_bikes
    Station.order('dock_count DESC').first
  end

  # Station objects or names?
  def self.top_stations(amount)
    Station.order('dock_count DESC').limit(amount)
  end

  # Fewest bikes available at a station (based on docks).
  def self.lowest_station(amount)
    Station.order('dock_count ASC').limit(amount)
  end
end
