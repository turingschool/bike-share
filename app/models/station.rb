class Station < ActiveRecord::Base
  belongs_to :city

  validates :name, presence: true, uniqueness: true
  validates :dock_count, :installation_date, presence: true

  def self.total_stations
    Station.count
  end

  def self.average_bikes_per_station
    Station.average(:dock_count)
    # 
    # total_docks = []
    # Station.all.each do |station|
    #   total_docks << station.dock_count
    # end
    # average(total_docks)
  end

end
