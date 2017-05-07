class Station < ActiveRecord::Base
  validates :name, :dock_count, :city, :date, presence: true

  # total count of stations
  def self.total
    Station.all.count
  end

end
