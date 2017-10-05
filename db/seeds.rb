require_relative "./../app/models/city"
require_relative "./../app/models/station"
require 'csv'


CSV.foreach('./db/csv/station.csv', headers: true, header_converters: :symbol) do |row|
    new_city          = City.find_or_create_by(name: row[:city])
    installation_date = Date.strptime(row[:installation_date], "%m/%d/%Y")

    Station.create(name:              row[:name],
                   lat:               row[:lat],
                   lng:               row[:long],
                   dock_count:        row[:dock_count],
                   city_id:           new_city.id,
                   installation_date: installation_date)
end