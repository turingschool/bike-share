# RSpec.describe "User can delete a trip" do
#   before :all do
#     start_date = DateTime.new(2001,2,3,4,5)
#     end_date = DateTime.new(2001,3,3,4,5)
#     installation_date = DateTime.new(2001,1,1,1,1)
#
#     Trip.create(duration: 10, start_station_id: 1, end_station_id: 3, bike_id: 318, zip_code: 94103, subscription_type: 'Subscriber', start_date: start_date, end_date: end_date)
#     Trip.create(duration: 15, start_station_id: 2, end_station_id: 2, bike_id: 318, zip_code: 97214, subscription_type: 'Subscriber', start_date: start_date, end_date: end_date)
#     Trip.create(duration: 20, start_station_id: 3, end_station_id: 3, bike_id: 348, zip_code: 95138, subscription_type: 'Subscriber', start_date: start_date, end_date: end_date)
#     Trip.create(duration: 25, start_station_id: 1, end_station_id: 1, bike_id: 348, zip_code: 94103, subscription_type: 'Customer', start_date: start_date, end_date: end_date)
#     Trip.create(duration: 30, start_station_id: 1, end_station_id: 3, bike_id: 318, zip_code: 32453, subscription_type: 'Customer', start_date: start_date, end_date: end_date)
#     visit("/trips/1")
#     save_and_open_page
#   end
#
#   it "from the trip id page" do
#     click_on("Delete")
#
#     expect(page).to_not have_content('1')
#   end
# end
