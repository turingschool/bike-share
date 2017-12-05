module Highest
  def highest_number_of_rides_from_temp(temp_floor)
    condition_trips(temp_floor).values.max
  end

  def highest_number_of_rides_from_wind(wind_floor)
    condition_trips_wind(wind_floor).values.max
  end

  def highest_number_of_rides_from_prec(floor)
    condition_trips_prec(floor).values.max
  end

  def highest_number_of_rides_from_visiblity(floor)
    condition_trips_vis(floor).values.max
  end

end
