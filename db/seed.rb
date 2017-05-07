require 'CSV'

stations = CSV.open './db/csv/station.csv', headers: true, header_converters: :symbol

stations.each do |row|
  city = City.find_or_create_by(name: row[:city])

end

