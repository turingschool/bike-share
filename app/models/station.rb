class Station < ActiveRecord::Base
  validates_presence_of :name, :city, :dock_count, :installation_date

  def self.total_count
    Station.count
  end

  def self.oldest_station
    Station.order(:installation_date).first
  end
end
