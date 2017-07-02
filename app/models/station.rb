class Station < ActiveRecord::Base

  validates_presence_of :name, :city, :dock_count, :installation_date
  def self.least_available_bikes
    Station.pluck(:dock_count).min
  end
end
