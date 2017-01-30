class Condition < ActiveRecord::Base
  #relationships with Station
  #relationships with Trips
  
  validates_presence_of :date,
                        :mean_temperature_f,
                        :min_temperature_f,
                        :mean_humidity,
                        :mean_visibility_miles,
                        :mean_wind_speed_mph,
                        :precipitation_inches
end
# once you have a Condition object (con = Condition.first or Condition.all.first)
# has_many does several things. One is giving you the dot notation to
# gather all data from the database pertaining to what you call after the dot
# such as con.stations => [bunch, of, station, objects]
