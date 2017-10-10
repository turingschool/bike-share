class Condition < ActiveRecord::Base
  validates :date,
            :max_temperature,
            :mean_temperature,
            :min_temperature,
            :mean_humidity,
            :mean_visibility,
            :mean_wind_speed,
            :precipitation,
            presence: true

  def self.average_number_rides_per_temp_range

  end




end



# Breakout of average number of rides, highest number of rides, and lowest number of rides on days with a high temperature in 10 degree chunks (e.g. average number of rides on days with high temps between fifty and sixty degrees)

# Breakout of average number of rides, highest number of rides, and lowest number of rides on days with precipitation in half-inch increments.
#
# Breakout of average number of rides, highest number of rides, and lowest number of rides on days with mean wind speeds in four mile increments.
#
# Breakout of average number of rides, highest number of rides, and lowest number of rides on days with mean visibility in miles in four mile increments.
