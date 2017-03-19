require './app/models/city'
require './app/models/station'
require 'pry'
require 'csv'

# binding.pry

CSV.foreach("db/csv/station.csv", headers: true, header_converters: :symbol) do |row|

  row = row.to_hash
  puts row
    # if row[:id] == "22"
      # binding.pry
    # end
  row.delete(:id)
  row.delete(:lat)
  row.delete(:long)
  row[:installation_date] = Date.strptime(row[:installation_date], "%m/%d/%Y")
  #create city, get id, pass in
  City.create(name: row[:city])
  row[:city_id] = City.find_by(name: row[:city]).id
  row.delete(:city)
  Station.create(row)
  puts Station.all.last.name
  puts Station.all.last.city
end




""
