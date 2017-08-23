require 'pry'
class Condition < ActiveRecord::Base
  has_many :condition_trips
  has_many :trips, :through => :condition_trips
  validates :date, :max_temperature, :mean_temperature, :min_temperature, :mean_humidity, :mean_visibility, :mean_wind_speed, :precipitation, presence: true

  def self.sort_temp(range)
    amount = []
    where(max_temperature: range).each do |condition|
      amount << condition.trips
    end
    amount.size
  end
end


