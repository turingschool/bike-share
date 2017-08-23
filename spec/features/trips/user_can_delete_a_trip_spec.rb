RSpec.describe "User can edit a trip" do
  it "when visiting 'trips/:id/edit'" do
    subscription = SubscriptionType.create(subscription_type: "Customer")
    station = Station.create(name: "Station_1", dock_count: 20, city: "bike town", installation_date: "3/4/15")
    trip = Trip.create(duration: 49, start_date: "2017-08-20 19:20:22", start_station_id: 1, end_date: "2017-08-20 19:20:22", end_station_id: 1, bike_id: 4, subscription_type: subscription, zip_code: 99000)

    visit "/trips"

    expect(page).to have_content("Banana Town")
    expect(page).to have_content("Customer")

    click_button("Delete")

    expect(page).to_not have_content("Banana Town")
    expect(page).to_not have_content("Customer")

  end
end
