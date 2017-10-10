class Station < ActiveRecord::Base


  validates_presence_of(
    :date,
    :max_temperature_f,
    :mean_temperature_f,
    :min_temperature_f,
    :mean_humidity,
    :mean_visibility_miles,
    :mean_wind_speed,
    :precipitation_inches
  )





end


=begin
* Breakout of average number of rides, highest number of rides, and lowest number of rides on days with a high temperature in 10 degree chunks (e.g. average number of rides on days with high temps between fifty and sixty degrees)

loop: 0-10, 10-20, ...
avg total rides
highest # of rides - by end_station or start_station, or by bike id or...?
lowest # of rides -- by what value?




* Breakout of average number of rides, highest number of rides, and lowest number of rides on days with precipitation in half-inch increments.
* Breakout of average number of rides, highest number of rides, and lowest number of rides on days with mean wind speeds in four mile increments.
* Breakout of average number of rides, highest number of rides, and lowest number of rides on days with mean visibility in miles in four mile increments.
=end
