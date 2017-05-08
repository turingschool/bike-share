class Station < ActiveRecord::Base
  belongs_to :city

  def self.average_available_bikes
    sum = 0
    self.all.each do |station|
      sum += station.dock_count
    end
    (sum / self.count)
  end

  def self.max_available_bikes
    self.all.max_by(3) do |station|
      station.dock_count
    end
  end
end

