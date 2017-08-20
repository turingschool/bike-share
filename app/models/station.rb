class Station < ActiveRecord::Base
  validates :name, presence: true
  validates :city_id, presence: true
  validates :dock_count, presence: true
  validates :installation_date, presence: true
  belongs_to :city

  def self.average_per_station
    Station.average(:dock_count)
  end

  def self.most_bikes_available_at_station
    Station.maximum(:dock_count)
  end

  def self.stations_with_most_bikes
    Station.where(dock_count: maximum(:dock_count)).order(:name)
  end

  def self.least_bikes_available_at_station
    Station.minimum(:dock_count)
  end


  def self.stations_with_most_bikes
    Station.where(dock_count: minimum(:dock_count)).order(:name)
  end

  def self.most_recent_installed_station
    Station.where(installation_date: maximum(:installation_date))
  end

  def self.oldest_station
    Station.where(installation_date: minimum(:installation_date))
  end


end
