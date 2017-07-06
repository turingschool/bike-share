class Weather < ActiveRecord::Base
  validates_presence_of :date
  has_many :trips

  def self.rides_by_max_temp
    Weather.average_rides("max_temperature", 10)
  end

  def self.average_rides(condition, increment)
    results = {}
    counter = (Weather.join_table.minimum("max_temperature")/10).to_i * 10
    upper_limit = (Weather.join_table.maximum("max_temperature")/10 + 1).to_i * 10
    until counter == upper_limit do
      range = Weather.join_table.where("#{condition} BETWEEN ? AND ?", counter, counter + increment)
      trip_count = range.count
      day_count = range.pluck("date").uniq.count
      results[[counter, counter + increment]] = trip_count/day_count
      counter += increment
    end
    return results
  end

  def self.highest_rides(condition, increment)
    results = {}
    counter = (Weather.join_table.minimum("max_temperature")/10).to_i * 10
    upper_limit = (Weather.join_table.maximum("max_temperature")/10 + 1).to_i * 10
    until counter == upper_limit do
      range = Weather.join_table.where("#{condition} BETWEEN ? AND ?", counter, counter + increment)
      results[[counter, counter + increment]] = range.group("date").count("id").values.max
      counter += increment
    end
    return results
  end

  def self.lowest_rides(condition, increment)
    results = {}
    counter = (Weather.join_table.minimum("max_temperature")/10).to_i * 10
    upper_limit = (Weather.join_table.maximum("max_temperature")/10 + 1).to_i * 10
    until counter == upper_limit do
      range = Weather.join_table.where("#{condition} BETWEEN ? AND ?", counter, counter + increment)
      results[[counter, counter + increment]] = range.group("date").count("id").values.min
      counter += increment
    end
    return results
  end

  def self.join_table
    Trip.joins(:weather)
  end
end
