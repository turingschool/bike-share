class Weather < ActiveRecord::Base
  validates_presence_of :date
  has_many :trips

  def self.rides_by_max_temp
    Weather.average_rides("max_temperature", 10)
  end

  def self.average_rides(condition, increment)
    results = {}
    join_table = Trip.joins(:weather)
    counter = (join_table.minimum("max_temperature")/10).to_i * 10
    upper_limit = (join_table.maximum("max_temperature")/10 + 1).to_i * 10
    until counter == upper_limit do
      range = join_table.where("#{condition} BETWEEN ? AND ?", counter, counter + increment)
      trip_count = range.count
      day_count = range.pluck("date").uniq.count
      binding.pry if day_count == 0
      results[[counter, counter + increment]] = trip_count/day_count unless day_count == 0
      counter += increment
    end
    results

  end
end
