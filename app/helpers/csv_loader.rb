require 'csv'
require 'date'
require 'time'
require 'pry'

class CSVLoader

  def sanitize_station(path)
    data = CSV.open(path, headers: true, header_converters: :symbol)

    data.map do |row|
      {
        :id => row[:id],
        :name => row[:name],
        :dock_count => row[:dock_count].to_i,
        :city => row[:city],
        :installation_date => date_formatter(row[:installation_date])
      }
    end
  end

  def sanitize_trips(path)
    data = CSV.open(path, headers: true, header_converters: :symbol)

    data.map do |row|
      {
        :duration => row[:duration].to_i,
        :start_date => date_formatter_trip(row[:start_date]),
        :start_station_id => row[:start_station_id].to_i,
        :end_date => date_formatter_trip(row[:end_date]),
        :end_station_id => row[:end_station_id].to_i,
        :bike_id => row[:bike_id].to_i,
        :subscription_type => row[:subscription_type].downcase,
        :zip_code => row[:zip_code].to_i
      }
    end
  end

  def sanitize_weather(path)
    data = CSV.open(path, headers: true, header_converters: :symbol)

    data.map do |row|
      if row[:precipitation_inches] == 'T'
        row[:precipitation_inches] = 0
      end
      {
        :date => date_formatter(row[:date]),
        :max_temperature => row[:max_temperature_f],
        :mean_temperature => row[:mean_temperature_f],
        :min_temperature => row[:min_temperature_f],
        :mean_humidity => row[:mean_humidity],
        :mean_visibility => row[:mean_visibility_miles],
        :mean_wind_speed => row[:mean_wind_speed_mph],
        :precipitation => row[:precipitation_inches]
      }
    end
  end

  def date_formatter(date)
    date_array = date.split('/')
    date = "#{date_array[1]}/#{date_array[0]}/#{date_array[2]}"
  end

  def date_formatter_trip(date)
    date_array = date.split(/[\/ ]/)
    date = "#{date_array[1]}/#{date_array[0]}/#{date_array[2]} #{date_array[3]}"
  end

end
