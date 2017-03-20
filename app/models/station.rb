class Station < ActiveRecord::Base
  belongs_to :city


  validates :name, presence: true, uniqueness: true
  validates :dock_count, presence: true
  validates :installation_date, presence: true
  validates :city_id, presence: true

  def self.average_bikes_per_station
    average(:dock_count).round(2)
  end

  def self.max_bikes_available
    maximum(:dock_count)
  end

  def self.station_with_most_bikes
    where(dock_count: self.max_bikes_available).map {|station| station.name}.join(", ")
  end

  def self.fewest_bikes_available
    minimum(:dock_count)
  end

  def self.station_with_fewest_bikes
    where(dock_count: self.fewest_bikes_available).map {|station| station.name}.join(", ")
  end

  def self.newest_station
    find_by(installation_date: maximum(:installation_date)).name
  end

  def self.oldest_station
    find_by(installation_date: minimum(:installation_date)).name
  end

end
