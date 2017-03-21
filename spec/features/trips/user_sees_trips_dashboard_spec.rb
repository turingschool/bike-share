# require_relative "../../spec_helper"
# 
# RSpec.describe "When a user visits '/trip-dashboard' " do
#   before :each do
#     city = City.create(name: "Denver")
#     @station1 = city.stations.create(name: "Turing", dock_count: 100, installation_date: "3/14/2017")
#     @station2 = city.stations.create(name: "Galvanize", dock_count: 1, installation_date: "4/01/1972")
#     @bike = Bike.create(bike_number: 33)
#     @subscription_type = SubscriptionType.create(subscription_type: "Subscriber")
#     @zip_code = ZipCode.create(zip_code: 80602)
#     @trip1 = Trip.create(duration: 100, start_date: "8/29/2013 14:14", start_station_id: @station1.id, end_date: "8/29/2013 20:14", end_station_id: @station2.id, bike_id: @bike.id, subscription_type_id: @subscription_type.id, zip_code_id: @zip_code.id)
#     @trip2 = Trip.create(duration: 200, start_date: "8/29/2013 14:14", start_station_id: @station1.id, end_date: "8/29/2013 20:14", end_station_id: @station2.id, bike_id: @bike.id, subscription_type_id: @subscription_type.id, zip_code_id: @zip_code.id)
#     @trip3 = Trip.create(duration: 2400, start_date: "8/29/2013 14:14", start_station_id: @station1.id, end_date: "8/29/2013 20:14", end_station_id: @station2.id, bike_id: @bike.id, subscription_type_id: @subscription_type.id, zip_code_id: @zip_code.id)
#   end
# 
#   it "they see a dashboard message" do
#     visit '/station-dashboard'
# 
#     within('h1') do
#       expect(page).to have_content('Welcome to the Station Dashboard!')
#     end
# 
#     within('div.total_stations') do
#       expect(page).to have_content("Total count of stations: 3")
#     end

  #   within('div.average_bikes') do
  #     expect(page).to have_content("Average bikes available per station: 8")
  #   end
  # 
  #   within('div.most_bikes') do
  #     expect(page).to have_content("Most bikes available at a station: 10")
  #   end
  # 
  #   within('div.stations_with_most_bikes') do
  #     expect(page).to have_content("Station(s) where the most bikes are available: LoDo, Five Points")
  #   end
  # 
  #   within('div.fewest_bikes') do
  #     expect(page).to have_content("Fewest bikes available at a station: 4")
  #   end
  # 
  #   within('div.stations_with_fewest_bikes') do
  #     expect(page).to have_content("Station(s) where the fewest bikes are available: Capital Hill")
  #   end
  # 
  #   within('div.newest_stations') do
  #     expect(page).to have_content("Most recently installed station(s): Capital Hill")
  #   end
  # 
  #   within('div.oldest_stations') do
  #     expect(page).to have_content("Oldest station(s): LoDo")
  #   end
  # end
# end
