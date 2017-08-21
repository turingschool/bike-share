class Condition < ActiveRecord::Base

  def self.convert_csv_to_condition_attributes
    a = Time.now
    conditions = []
    conditions << CSV.read('db/csv/weather.csv', {headers: true, header_converters: :symbol}) #do |row|
    # conditions << Condition.new(date:     Date.strptime(row[:date], '%m/%e/%Y'),
    #                 max_temperature_f:     row[:max_temperature_f],
    #                 mean_temperature_f:    row[:mean_temperature_f],
    #                 min_temperature_f:     row[:min_temperature_f],
    #                 mean_humidity:         row[:mean_humidity],
    #                 mean_visibility_miles: row[:mean_visibility_miles],
    #                 mean_wind_speed_mph:   row[:mean_wind_speed_mph],
    #                 precipitation_inches:  row[:precipitation_inches]
    #                 )
    # end
    b = Time.now
    puts "Creating the trips array took #{b - a} seconds"
    conditions
  end

end
