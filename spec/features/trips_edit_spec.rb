require_relative '../spec_helper'

RSpec.describe "when a user visits /trips/:id/edit" do
  it "they can edit that trip" do
    City.create(name:"San Jose")
    Station.create(name: "Union Station", dock_count: 12, installation_date: "15/5/2016", city_id: 1)
    Bike.create(bike_number: 23)
    Bike.create(bike_number: 25)
    ZipCode.create(zip_code: 80210)
    SubscriptionType.create(subscription_type: "Subscriber")
    Trip.create(duration: 63, start_date: "23/8/2014", start_station_id: 1, end_date: "23/8/2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1, zip_code_id: 1)
    visit "trips/1/edit"
    fill_in "trip[bike_id]", with: 2
    click_on "Submit"

    expect(current_path).to eq("/trips/1")

    expect(page).to have_content("Bike Number: 25")
  end
end