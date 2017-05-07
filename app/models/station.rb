class Station < ActiveRecord::Base
  validates :name, :dock_count, :city, :date, presence: true

  # total count of stations
  def self.total
    Station.all.count
  end

  # average bikes per station
  def self.average_bikes
    Station.average(:dock_count).round
  end

  # Station(s) where the most bikes are available (based on docks).
  def self.most_bikes
    Station.order('dock_count DESC').first
  end
end
