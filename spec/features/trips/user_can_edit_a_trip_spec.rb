RSpec.describe "User can edit a trip" do
  it "when visiting 'trips/:id/edit'" do
    subscription = SubscriptionType.create(subscription_type: "Subscriber")
    subscription = SubscriptionType.create(subscription_type: "Customer")
    station = Station.create(name: "Station_1", dock_count: 20, city: "bike town", installation_date: "3/4/15")
    trip = Trip.create(duration: 49, start_date: "2017-08-20 19:20:22", start_station_id: 1, end_date: "2017-08-20 19:20:22", end_station_id: 1, bike_id: 4, subscription_type: subscription, zip_code: 99000)

    visit "/trips/#{trip.id}"

    click_button("Edit")

    fill_in("trip[duration]", with: 45)
    fill_in("trip[start_date]", with: "2017-08-20 19:20:22")
    fill_in("trip[start_station_id]", with: 1)
    fill_in("trip[end_date]", with: "2017-08-20 19:20:22")
    fill_in("trip[end_station_id]", with: 1)
    fill_in("trip[bike_id]", with: 547835)
    select("Customer", from: "trip[subscription_type_id]")
    fill_in("trip[zip_code]", with: 90210)
    click_on("Submit Changes")

    expect(page).to have_content("The trip lasted 45 minutes")
    expect(page).to have_content("The trip started at Station_1, and ended at Station_1")
    expect(page).to have_content("The trip was on bike# 547835")
    expect(page).to have_content("The trip zip code was 90210")
  end
end
