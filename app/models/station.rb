class Station < ActiveRecord::Base
  belongs_to :city
  validates :name, :dock_count, :install_date, presence: true
  validates :dock_count, numericality: { greater_than: 0, only_integer: true }

  def self.average_available_bikes
    average(:dock_count).to_i
  end

  def self.max_available_bikes
    maximum(:dock_count).to_i
    end
  end

end

