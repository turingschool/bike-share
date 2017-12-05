class Station < ActiveRecord::Base

  # has_many :trips

  has_many :trips, foreign_key: "start_station_id", class_name: "Trip"
  # has_many :trip_ends,   foreign_key: "end_station_id",   class_name: "Trip"

  validates_presence_of :name, :dock_count, :city, :installation_date

  def self.stations_with_max_bikes
    max = maximum(:dock_count)
    where(dock_count: max)

  end

  def self.stations_with_min_bikes
    min = minimum(:dock_count)
    where(dock_count: min)
  end

  def self.recently_installed_station
    min  =  minimum(:installation_date)
    find_by(installation_date: min).name
  end

  def self.oldest_station
    max  =  maximum(:installation_date)
    find_by(installation_date: max).name
  end

  def self.maximum_dock_count
    maximum(:dock_count)
  end

  def self.minimum_dock_count
    minimum(:dock_count)
  end


  def self.average_dock_count
    average(:dock_count).to_i
  end



end
