class Station < ActiveRecord::Base

  validates_presence_of :name, :city, :dock_count, :installation_date


  def self.average_bikes_available_per_station
    average(:dock_count).round
  end

  def self.most_recently_installed
    self.order(:installation_date).last
  end
end
