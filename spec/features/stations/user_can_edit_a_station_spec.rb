require './app/models/station'

RSpec.describe "User visits /stations/:id/edit" do
  it "when visiting /stations" do
    subscription = SubscriptionType.create(subscription_type: "Customer")
    subscription_1 = SubscriptionType.create(subscription_type: "Subscriber")
    Trip.create(duration: 49, start_date: "2017-08-20 19:20:22", start_station_id: 1, end_date: "2017-08-20 19:20:22", end_station_id: 1, bike_id: 4, subscription_type: subscription, zip_code: 99000)
    Trip.create(duration: 9487, start_date: "2017-08-25 19:20:22", start_station_id: 2, end_date: "2017-08-29 19:20:22", end_station_id: 2, bike_id: 566, subscription_type: subscription, zip_code: 99000)
    Trip.create(duration: 49, start_date: "2017-08-20 19:20:22", start_station_id: 3, end_date: "2017-08-20 19:20:22", end_station_id: 3, bike_id: 999, subscription_type: subscription, zip_code: 99000)
    station = Station.create(name: "Station_1", dock_count: 20, city: "bike town", installation_date: "2017-08-04")

    visit "/stations/#{station.id}"

    expect(page).to have_content("Station_1")
    click_on("Edit this Station")

    fill_in("station[name]", with: "Station_edit")
    fill_in("station[dock_count]", with: 30)
    fill_in("station[city]", with: "cityville")
    fill_in("station[installation_date]", with: "2017-08-05")
    click_on("Submit Changes")

    expect(page).to have_content("Station_edit")
    expect(page).to have_content(30)
    expect(page).to have_content("cityville")
    expect(page).to have_content("2017-08-05")

  end
end
