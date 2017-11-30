
class Station < ActiveRecord::Base

  validates_presence_of :name, :dock_count, :city, :installation_date

  def self.average_bikes_per_station
    average(:dock_count).to_i
  end

  def self.most_bikes
    maximum(:dock_count)
  end

  def self.with_most_bikes
    stations = Station.all
    stations("SELECT * FROM stations WHERE dock_count = ?",
    Station.most_bikes)
    stations.each do |station|
      station.name
    end
  end


end
