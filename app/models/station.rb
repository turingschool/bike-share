class Station < ActiveRecord::Base
  belongs_to :city
  validates :name, :dock_count, :city_id, :install_date, presence: true
  validates :dock_count, numericality: { greater_than: 0, only_integer: true }

  def self.average_available_bikes
    average(:dock_count).to_i
  end

  def self.max_available_bikes
    all.max_by(3) do |station|
      station.dock_count
    end
  end

end

