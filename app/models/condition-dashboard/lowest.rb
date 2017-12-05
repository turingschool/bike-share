module Lowest
def lowest_number_of_rides_from_temp(temp_floor)
  condition_trips(temp_floor).values.min
end

def lowest_number_of_rides_from_visibility(temp_floor)
  condition_trips_vis(temp_floor).values.min
end

def lowest_number_of_rides_from_prec(floor)
  condition_trips_prec(floor).values.min
end

def lowest_number_of_rides_from_wind(wind_floor)
  condition_trips_wind(wind_floor).values.min
end
end
