require 'csv'
require './app/models/station.rb'


Station.destroy_all
open_contents = CSV.open('./db/csv/station.csv', headers: true, header_converters: :symbol)


open_contents.each do |row|
  Station.create!(name: row[:name],
                  dock_count: row[:dock_count],
                  city: row[:city], installation_date: row[:installation_date])
end
