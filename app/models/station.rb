class Station < ActiveRecord::Base
  belongs_to :city

  def self.average_available_bikes
    average(:dock_count).to_i
  end

  def self.max_available_bikes
    all.max_by(3) do |station|
      station.dock_count
    end
  end
end

