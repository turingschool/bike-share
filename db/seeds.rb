require_relative "./../app/models/city"
require_relative "./../app/models/station"
require 'csv'


CSV.foreach('./db/csv/station.csv', headers: true, header_converters: :symbol) do |station|
    new_city = City.find_or_create_by(name: station[:city])
    Station.create(name: station[:name],
                   dock_count: station[:dock_count],
                   city_id: new_city.id,
                   installation_date: Date.strptime(station[:installation_date], "%m/%d/%Y"))
end
