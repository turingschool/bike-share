class Station < ActiveRecord::Base

  validates_presence_of :name, :city, :dock_count, :installation_date

  def self.fewest_bikes_available
    station = Station.minimum(:dock_count)
    Station.where(dock_count: station)
  end

end
