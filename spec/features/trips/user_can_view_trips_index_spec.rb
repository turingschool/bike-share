require './app/models/trip'

RSpec.describe "User visits '/trips'" do
  it "sees information on 30 trips per page" do

    subscription = SubscriptionType.create(subscription_type: "Customer")
    subscription_1 = SubscriptionType.create(subscription_type: "Subscriber")
    station = Station.create(name: "Station_1", dock_count: 20, city: "bike town", installation_date: "3/4/15")
    station = Station.create(name: "Station_2", dock_count: 20, city: "pedal town", installation_date: "3/4/15")
    station = Station.create(name: "Station_3", dock_count: 20, city: "handlebar village", installation_date: "3/4/15")
    Trip.create(duration: 49, start_date: "2017-08-20 19:20:22", start_station_id: 1, end_date: "2017-08-20 19:20:22", end_station_id: 1, bike_id: 4, subscription_type: subscription, zip_code: 99000)
    Trip.create(duration: 9487, start_date: "2017-08-25 19:20:22", start_station_id: 2, end_date: "2017-08-29 19:20:22", end_station_id: 2, bike_id: 566, subscription_type: subscription, zip_code: 99000)
    Trip.create(duration: 49, start_date: "2017-08-20 19:20:22", start_station_id: 3, end_date: "2017-08-20 19:20:22", end_station_id: 3, bike_id: 999, subscription_type: subscription, zip_code: 99000)

    visit '/trips'
    
    expect(page).to have_content("Station_1")
    expect(page).to have_content("Station_2")
    expect(page).to have_content("Station_3")

  end
end
