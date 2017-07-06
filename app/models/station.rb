class Station < ActiveRecord::Base
  has_many :started_trips, :class_name => "Trip", :foreign_key => :id
  has_many :ended_trips, :class_name => "Trip", :foreign_key => :id

  belongs_to :city
  validates :name, presence: true
  validates :dock_count, presence: true
  validates :city_id, presence: true
  validates :installation_date, presence: true


  def self.total_stations
    Station.count
  end

  def self.average_bikes_per_station
    Station.average(:dock_count)
  end

  def self.most_available
    max = Station.maximum(:dock_count)
  end

  def self.stations_with_most_bikes_available
    Station.where(dock_count: most_available)
  end

  def self.least_available
    Station.minimum(:dock_count)
  end

  def self.stations_with_least_bikes_available
    Station.where(dock_count: least_available)
  end

  def self.most_recent_install
    station = Station.order(:installation_date).last
    station = station.installation_date
    station
  end

  def self.most_recent_install_station
    Station.where(installation_date: most_recent_install)
  end

  def self.oldest_install
    Station.order(:installation_date).first.installation_date
  end

  def self.oldest_installed_station
    Station.where(installation_date: oldest_install)
  end
end
