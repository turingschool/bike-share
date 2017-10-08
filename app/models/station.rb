class Station < ActiveRecord::Base
  validates_presence_of :name, :dock_count, :city, :installation_date

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

end
