require './app/models/station.rb'
require 'csv'
require 'Date'
require 'pry'

def delete_columns(path, column_headers)
  table = CSV.table(path)
  column_headers.each do |column_header|
    table.delete(column_header)
  end
  table
end

Station.destroy_all
system 'Say "Destroying Stations Complete"'

stations = delete_columns("./db/csv/station.csv", [:lat, :long])

stations.each do |row|
  row = row.to_h
  row[:installation_date] = Date.strptime(row[:installation_date], '%m/%d/%Y')
  Station.create!(row)
end

start_time = Time.now
