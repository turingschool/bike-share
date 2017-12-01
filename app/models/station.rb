class Station < ActiveRecord::Base


  def self.station_count
    count
  end

  def self.average_bikes_per_station
    average(:dock_count).to_i
  end

  def self.max_bikes_per_station
    maximum(:dock_count)
  end

  def self.
end
