class Weather < ActiveRecord::Base
  validates_presence_of :date
  has_many :trips

  def self.rides_by_max_temp
    lower_limit = (Weather.minimum("max_temperature")/10).to_i * 10
    upper_limit = (Weather.maximum("max_temperature")/10 + 1).to_i * 10
    Weather.average_rides("max_temperature", upper_limit, lower_limit, 10)
    # trip_count = Trip.joins(:weather).where('max_temperature BETWEEN ? AND ?',40, 50).count
    # day_count = Trip.joins(:weather).where('max_temperature BETWEEN ? AND ?',40, 50).pluck("date").uniq.count
    # trip_count/day_count
  end

  def self.average_rides(condition, upper_limit, lower_limit, increment)
    join_table = Trip.joins(:weather).where("#{condition} BETWEEN ? AND ?", lower_limit, lower_limit + increment)
    trip_count = join_table.count
    day_count = join_table.pluck("date").uniq.count
    trip_count/day_count
  end
end
