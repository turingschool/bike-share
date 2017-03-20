require 'csv'
require './app/models/station.rb'
require 'pry'


Station.destroy_all
open_contents = CSV.open('./db/csv/station.csv', headers: true, header_converters: :symbol)


open_contents.each do |row|
  date = row[:installation_date]
  row[:installation_date] = Date.strptime(date, '%m/%d/%Y')
  binding.pry
  Station.create!(name: row[:name],
                  dock_count: row[:dock_count],
                  city: row[:city], installation_date: row[:installation_date])
end
