require './app/models/trip'

RSpec.describe "User visits '/trips'" do
  it "sees information on 30 trips per page" do

    subscription = SubscriptionType.create(subscription_type: "Customer")
    subscription = SubscriptionType.create(subscription_type: "Subscriber")
    station = Station.create(name: "Station_1", dock_count: 20, city: "bike town", installation_date: "3/4/15")
    Trip.create(duration: 49, start_date: "2017-08-20 19:20:22", start_station_id: 84, end_date: "2017-08-20 19:20:22", end_station_id: 94, bike_id: 4, subscription_type: "Customer", zip_code: 99000)
    Trip.create(duration: 9487, start_date: "2017-08-25 19:20:22", start_station_id: 84, end_date: "2017-08-29 19:20:22", end_station_id: 94, bike_id: 566, subscription_type: "Subscriber", zip_code: 99000)
    Trip.create(duration: 49, start_date: "2017-08-20 19:20:22", start_station_id: 84, end_date: "2017-08-20 19:20:22", end_station_id: 94, bike_id: 999, subscription_type: "Customer", zip_code: 99000)
    Trip.create(duration: 49, start_date: "2017-08-20 19:20:22", start_station_id: 84, end_date: "2017-08-20 19:20:22", end_station_id: 94, bike_id: 847, subscription_type: "Customer", zip_code: 99000)

    visit '/trips'
\
    expect(page).to have_content("Banana Town")
    expect(page).to have_content("Denver")
    expect(page).to have_content("Pants Town")
    expect(page).to have_content("Chicago")
    expect(page).to have_content("Edit")

  end
end
