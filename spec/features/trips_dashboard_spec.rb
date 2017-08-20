require './app/models/trip'
require 'pry'


RSpec.describe "User visits '/trips-dashboard'" do
  it "average duration of trip" do
    Trip.create(duration: 49, start_date: "2017-08-20 19:20:22",  start_station_name: "Banana Town", start_station_id: 84, end_date: "2017-08-20 19:20:22", end_station_name: "Pants Town", end_station_id: 94, bike_id: 4, subscription_type: "Customer", zip_code: 99000)
    Trip.create(duration: 40, start_date: "2017-08-05 19:20:22",  start_station_name: "San Fran", start_station_id: 84, end_date: "2017-08-05 19:20:22", end_station_name: "Somewhere", end_station_id: 94, bike_id: 520, subscription_type: "Customer", zip_code: 12345)

    visit '/trips-dashboard'


    expect(page).to have_content("44")
  end

  it "shows longest ride" do
    Trip.create(duration: 49, start_date: "2017-08-20 19:20:22",  start_station_name: "Banana Town", start_station_id: 84, end_date: "2017-08-20 19:20:22", end_station_name: "Pants Town", end_station_id: 94, bike_id: 4, subscription_type: "Customer", zip_code: 99000)
    Trip.create(duration: 40, start_date: "2017-08-05 19:20:22",  start_station_name: "San Fran", start_station_id: 84, end_date: "2017-08-05 19:20:22", end_station_name: "Somewhere", end_station_id: 94, bike_id: 520, subscription_type: "Customer", zip_code: 12345)

    visit '/trips-dashboard'

    expect(page).to have_content("49")
  end

  it "shows shortest ride" do
    Trip.create(duration: 49, start_date: "2017-08-20 19:20:22",  start_station_name: "Banana Town", start_station_id: 84, end_date: "2017-08-20 19:20:22", end_station_name: "Pants Town", end_station_id: 94, bike_id: 4, subscription_type: "Customer", zip_code: 99000)
    Trip.create(duration: 40, start_date: "2017-08-05 19:20:22",  start_station_name: "San Fran", start_station_id: 84, end_date: "2017-08-05 19:20:22", end_station_name: "Somewhere", end_station_id: 94, bike_id: 520, subscription_type: "Customer", zip_code: 12345)

    visit '/trips-dashboard'

    expect(page).to have_content("40")
  end
end
