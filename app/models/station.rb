class Station < ActiveRecord::Base
  validates_presence_of :name, :city, :dock_count, :installation_date

  def self.total_count
    Station.all.count
  end
end
