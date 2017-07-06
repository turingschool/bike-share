class Weather < ActiveRecord::Base
  validates_presence_of :date
  has_many :trips

  def self.rides_by_max_temp
    lower_range_limit = Weather.minimum("max_temperature")/10 * 10
    upper_range_limit = (Weather.maximum("max_temperature")/10 + 1) * 10
    # Trip.joins(:weather).where("max_temperature > ?", 40).where("max_temperature < ?", 60).pluck("max_temperature")
    # Trip.joins(:weather).where("max_temperature > ?", 40).where("max_temperature < ?", 60).group(:weather).count(:id)
    # day_count = Trip.joins(:weather).where("max_temperature > ?", 40).where("max_temperature < ?", 60).pluck("date").uniq.count
    trip_count = Trip.joins(:weather).where('max_temperature BETWEEN ? AND ?',40, 50).count
    day_count = Weather.where('max_temperature BETWEEN ? AND ?',40, 50).count
    trip_count/day_count
  end
end
