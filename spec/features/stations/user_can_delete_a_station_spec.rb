RSpec.describe "User can delete a station" do
  it "when visiting '/stations'" do
    subscription = SubscriptionType.create(subscription_type: "Customer")
    Trip.create(duration: 49, start_date: "2017-08-20 19:20:22", start_station_id: 1, end_date: "2017-08-20 19:20:22", end_station_id: 1, bike_id: 4, subscription_type: subscription, zip_code: 99000)
    station = Station.create(name: "Station_1", dock_count: 20, city: "bike town", installation_date: "2017-08-04")

    visit "/stations"

    expect(page).to have_content("Station_1")
    expect(page).to have_content(20)

    click_button("Delete")

    expect(page).to_not have_content("Station_1")
    expect(page).to_not have_content(20)
  end
end
