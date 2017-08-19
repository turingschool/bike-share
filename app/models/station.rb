class Station < ActiveRecord::Base
  validates :name, presence: true
  validates :dock_count, presence: true
  validates :city, presence: true
  validates :installation_date, presence: true

  def self.total_stations
    count
  end

  def self.avg_bikes_avail
    average(:dock_count)
  end

  def self.most_bikes_avail
    maximum(:dock_count)
  end

  def self.station_with_most_bikes
    find_by(dock_count: most_bikes_avail).name
  end

  def self.fewest_bikes_avail
    minimum(:dock_count)
  end

  def self.station_with_fewest_bikes
    find_by(dock_count: fewest_bikes_avail).name
  end

  def self.most_recent_install_station
    order(:installation_date).last.name
  end

  def self.oldest_install_station
    order(:installation_date).first.name
  end
  
end
