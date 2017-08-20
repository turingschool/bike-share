require 'csv'

class CSVLoader
  def sanitize_station(path)
    data = CSV.open(path, headers: true, header_converters: :symbol)

    data.map do |row|

      {
        :id => row[:id],
        :name => row[:name],
        :dock_count => row[:dock_count].to_i,
        :city => row[:city],
        :installation_date => row[:installation_date]
      }
    end
  end

  def sanitize_trip(path)
    data = CSV.open(path, headers: true, header_converters: :symbol)

    data.map do |row|

      {
        :duration => row[:duration],
        :start_date => row[:start_date],
        :start_station_id => row[:start_station_id],
        :end_date => row[:end_date],
        :end_station_id => row[:end_station_id],
        :bike_id => row[:bike_id]
        :subscription_type => row[:subscription_type]
        :zip_code => row[:subscription_type]
      }
    end
  end
end
