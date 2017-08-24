RSpec.describe "User can create a new trip" do
  it "when visiting 'trips/new'" do

    subscription = SubscriptionType.create(subscription_type: "Customer")
    subscription_1 = SubscriptionType.create(subscription_type: "Subscriber")
    station = Station.create(name: "Station_1", dock_count: 20, city: "bike town", installation_date: "3/4/15")
    station = Station.create(name: "Station_2", dock_count: 20, city: "pedal town", installation_date: "3/4/15")
    station = Station.create(name: "Station_3", dock_count: 20, city: "handlebar village", installation_date: "3/4/15")

    visit '/trips/new'

    expect(page).to have_field("trip[start_date]")

    fill_in("trip[duration]", with: 45)
    fill_in("trip[start_date]", with: "2017-08-20 19:20:22")
    fill_in("trip[start_station_id]", with: 1)
    fill_in("trip[end_date]", with: "2017-08-20 19:20:22")
    fill_in("trip[end_station_id]", with: 2)
    fill_in("trip[bike_id]", with: 547835)
    select("Subscriber", from: "trip[subscription_type_id]")
    fill_in("trip[zip_code]", with: 90210)
    click_on("Submit")

    expect(page).to have_content("The trip lasted 45 minutes")
    expect(page).to have_content("The trip started at Station_1, and ended at Station_2")
    expect(page).to have_content("The trip was on bike# 547835")
    expect(page).to have_content("The trip zip code was 90210")
  end
end
