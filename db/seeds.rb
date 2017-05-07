require 'csv'
require_relative '../app/models/csv_loader'
require_relative '../app/models/station'

CSV.foreach("db/csv/station.csv", { encoding: "UTF-8", headers: ['name', 'dock_count', 'city', 'installation_date'], header_converters: :symbol, converters: :all}) do |row|
  row = CSVLoader.row
  Station.create(CSVLoader.sanitize(row))
end