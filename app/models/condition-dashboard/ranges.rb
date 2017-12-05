module Ranges

    def precipitation_range(floor)
      [floor..(floor+0.5)]
    end

    def temp_range(temp_floor)
      [temp_floor..temp_floor + 9]
    end

    def wind_range(wind_floor)
      [wind_floor..wind_floor + 4]
    end

end
