module Relations

def condition_trips(temp_floor)
  conditions = where(max_temperature_f: temp_range(temp_floor))
  conditions.joins(:trips).group(:date).count("id")
end

def condition_trips_prec(floor)
  conditions_prec = where(precipitation_inches: precipitation_range(floor))
  conditions_prec.joins(:trips).group(:date).count("id")
end

def condition_trips_wind(wind_floor)
  conditions_wind= where(mean_wind_speed_mph: wind_range(wind_floor))
  conditions_wind.joins(:trips).group(:date).count("id")
end

def condition_trips_vis(wind_floor)
  conditions_wind= where(mean_visibility_miles: wind_range(wind_floor))
  conditions_wind.joins(:trips).group(:date).count("id")
end

end
