require 'csv'
require './app/models/station.rb'


def import_station_csv
  CSV.foreach('db/csv/station.csv', :headers=> true) do |row|
    Trip.create!({
      name: row["name"],
      doc_count: row["doc_count"],
      city: row["city"],
      installation_date: row["installation_date"]})

  end
end
