class WeatherCondition < ActiveRecord::Base

  has_many :trips

  validates :max_temperature_f, presence: true
  validates :min_temperature_f, presence: true
  validates :mean_temperature_f, presence: true
  validates :mean_humidity, presence: true
  validates :mean_visibility_miles, presence: true
  validates :mean_wind_speed_mph, presence: true
  validates :precipitation_inches, presence: true
  validates :date, presence: true
  
    def self.trips_by_temperature
      temp_range = [[40,49],[50,59],[60,69],[70,79],[80,89]]
      trips_by_weather_condition(:max_temperature_f, temp_range)
    end

    def self.trips_by_precipitation
      precip_range = [[0.0,0.49],[0.5,0.99],[100,1.49],[1.50,1.99]]
      trips_by_weather_condition(:precipitation_inches, precip_range)
    end

    def self.trips_by_wind_speed
      wind_speed_range = [[0,4],[5,8],[9,12],[13,16],[17,20],[21,24]]
      trips_by_weather_condition(:mean_wind_speed_mph, wind_speed_range)
    end

    def self.trips_by_visibility
      visibility_range = [[0,4],[5,8],[9,12],[13,16],[17,20]]
      trips_by_weather_condition(:mean_visibility_miles, visibility_range)
    end

    def self.trips_by_weather_condition(weather_variable, weather_condition_range)
      weather_condition_range.reduce({}) do |trips_by_weather, stat_range|
        query = self.where("#{weather_variable} >= ? AND #{weather_variable} <= ?", stat_range[0], stat_range[1])

        trip_date = query.reduce({}) do |trips_per_date, condition|
          trips_per_date.merge!({condition.date => condition.trips.count})
        end
        key = stat_range.join(" - ")
        trips_by_weather.merge!({key => trip_date})
      end
    end

end
