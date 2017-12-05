class Condition < ActiveRecord::Base
  has_many :trip_dates, :class_name => "Trip", :foreign_key => "start_date", :primary_key => "date"
 
  def self.number_of_trips_for_day_with_temperature(range)
    Condition.joins(:trip_dates).where(max_temperature_f: range..range + 9)
  end

  def self.maximum_temperature_of_all_days
    maximum(:max_temperature_f)
  end

  def self.minimum_temperature_of_all_days
    minimum(:min_temperature_f)
  end

end
