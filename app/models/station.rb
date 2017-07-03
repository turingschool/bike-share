class Station < ActiveRecord::Base
  validates_presence_of :name, :city, :dock_count, :installation_date_id
  belongs_to :installation_date, class_name: "BikeShareDate", foreign_key: "installation_date_id"

  # def self.create_by_name(name)
  #   find_or_create_by(name: name).id
  # end
  # finds or creates Station object and returns its id # not needed if we do drop-down menu

  def self.total_count
    Station.count
  end

  def self.most_number_of_available_bikes
    Station.pluck(:dock_count).max
  end

  def self.least_number_of_available_bikes
    Station.pluck(:dock_count).min
  end

  def self.oldest_station
    Station.includes(:installation_date).order('bike_share_dates.date').first
  end

  def self.station_with_most_bikes
    most_bikes = Station.maximum(:dock_count)
    Station.where(dock_count: most_bikes)
  end

  def self.average_bikes_available_per_station
    average(:dock_count).round
  end

  def self.most_recently_installed
    Station.includes(:installation_date).order('bike_share_dates.date').last
  end

  def self.stations_with_fewest_bikes_available
    station = Station.minimum(:dock_count)
    Station.where(dock_count: station)
  end
end
