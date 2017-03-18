require './app/models/station.rb'
require './app/models/city.rb'


Station.destroy_all

Station.create(name: "Navy Pier", dock_count: "10",  installation_date: "20160203", city_id: 2)
Station.create(name: "Carl", dock_count: "107", installation_date: "20160204", city_id: 1)
Station.create(name: "HelloStation", dock_count: "120",  installation_date: "20160206", city_id: 2)
Station.create(name: "DenverStation", dock_count: "420", installation_date: "20160206", city_id: 3)


City.create(name: "Denver")
City.create(name: "Chicago")
City.create(name: "Seaver")


# horses  = [
#             {name: "Penelope", age: 29, total_winnings: 34000, breed_id: 1, jockey_id: 1},
#             {name: "Penelope", age: 39, total_winnings: 500, breed_id: 1, jockey_id: 2},
#             {name: "Paulo", age: 45, total_winnings: 45000, breed_id: 2, jockey_id: 3},
#             {name: "Pepe", age: 39, total_winnings: 1000000, breed_id: 2, jockey_id: 4},
#             {name: "Pete", age: 55, total_winnings: 4000, breed_id: 3, jockey_id: 5},
#             {name: "Paige", age: 20, total_winnings: 78000, breed_id: 3, jockey_id: 1},
#             {name: "Peyton", age: 95, total_winnings: 898344, breed_id: 4, jockey_id: 2},
#             {name: "Patricia", age: 49, total_winnings: 78000, breed_id: 4, jockey_id: 3},
#             {name: "Patricia", age: 49, total_winnings: 8978000, breed_id: 5, jockey_id: 4},
#             {name: "Picasso", age: 15, total_winnings: 78000, breed_id: 5, jockey_id: 5}
#           ]
#
#
#
# horses.each do |horse|
#   puts "Creating horse: #{horse[:name]}"
#   Horse.create!(horse)
# end
