require './app/models/station'

RSpec.describe "User visits '/stations/:id'" do
  it "sees specific information for that station" do
    subscription = SubscriptionType.create(subscription_type: "Customer")
    subscription_1 = SubscriptionType.create(subscription_type: "Subscriber")
    Trip.create(duration: 49, start_date: "2017-08-20 19:20:22", start_station_id: 1, end_date: "2017-08-20 19:20:22", end_station_id: 1, bike_id: 4, subscription_type: subscription, zip_code: 99000)
    Trip.create(duration: 9487, start_date: "2017-08-25 19:20:22", start_station_id: 2, end_date: "2017-08-29 19:20:22", end_station_id: 2, bike_id: 566, subscription_type: subscription, zip_code: 99000)
    Station.create(name: "Station_1", dock_count: 8, city: "Banana Town", installation_date: "2017-08-20 19:20:22")
    Station.create(name: "Station_2", dock_count: 6, city: "San Fran", installation_date: "2017-10-20 19:20:22")

    visit '/stations/1'

    expect(page).to have_content("Station_1")
    expect(page).to have_content("8")
    expect(page).to have_content("Banana Town")
    expect(page).to have_content("2017-08-20")

    expect(page).to_not have_content("Station_2")
  end
end
