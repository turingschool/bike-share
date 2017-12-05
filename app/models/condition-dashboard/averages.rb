module Averages

def average_number_of_rides_from_temp(temp_floor)
  sum_dates = condition_trips(temp_floor).values.sum
  amount = condition_trips(temp_floor).values.count
  sum_dates/amount if amount > 0
end

def average_number_of_rides_from_prec(floor)
  sum_dates =condition_trips_prec(floor).values.sum
  amount = condition_trips_prec(floor).values.count
  sum_dates/amount if amount > 0
end

def average_number_of_rides_from_wind(wind_floor)
  sum_dates =condition_trips_wind(wind_floor).values.sum
  amount = condition_trips_wind(wind_floor).values.count
  sum_dates/amount if amount > 0
end

def average_number_of_rides_from_visibility(wind_floor)
  sum_dates =condition_trips_vis(wind_floor).values.sum
  amount = condition_trips_vis(wind_floor).values.count
  sum_dates/amount if amount > 0
end
end
