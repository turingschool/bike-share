class Station < ActiveRecord::Base

  validates_presence_of :name, :city, :dock_count, :installation_date

  def self.most_available_bikes
    Station.pluck(:dock_count).max
  end
end
