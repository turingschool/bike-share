require_relative '../spec_helper'

RSpec.describe "when a user visits /trips/1" do
  it "they see the trip's info" do
    Station.create(name: "Union Station", dock_count: 12, installation_date: "15/5/16", city_id: 1)
    Bike.create(bike_number: 23)
    ZipCode.create(zip_code: 80210)
    Trip.create(duration: 63, start_date: "23/8/2014", start_station_id: 1, end_date: "23/8/2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1, zip_code_id: 1)
    SubscriptionType.create(subscription_type: "Subscriber")
    visit '/trips/1'

    within("h1.title") do
      expect(page).to have_content("Trip: 1")
    end

      expect(page).to have_content("Trip Duration: 63 minutes")
      expect(page).to have_content("Start Date: 2014-08-23")
      expect(page).to have_content("End Date: 2014-08-23")
      expect(page).to have_content("Start Station: Union Station")
      expect(page).to have_content("End Station: Union Station")
      expect(page).to have_content("Bike Number: 23")
      expect(page).to have_content("Subscription Type: Subscriber")
      expect(page).to have_content("Zip Code: 80210")

  end

  it "they can delete that trip" do
    Station.create(name: "Union Station", dock_count: 12, installation_date: "15/5/16", city_id: 1)
    Bike.create(bike_number: 23)
    ZipCode.create(zip_code: 80210)
    Trip.create(duration: 63, start_date: "23/8/2014", start_station_id: 1, end_date: "23/8/2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1, zip_code_id: 1)
    SubscriptionType.create(subscription_type: "Subscriber")
    visit '/trips/1'

    click_on "Delete"

    expect(current_path).to eq("/trips")

    within("table") do
      expect(page).not_to have_content("1")
    end
  end

  it "they can edit that trip" do
    Station.create(name: "Union Station", dock_count: 12, installation_date: "15/5/16", city_id: 1)
    Bike.create(bike_number: 23)
    ZipCode.create(zip_code: 80210)
    Trip.create(duration: 63, start_date: "23/8/2014", start_station_id: 1, end_date: "23/8/2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1, zip_code_id: 1)
    SubscriptionType.create(subscription_type: "Subscriber")
    visit '/trips/1'

    within "#edit-button" do
      click_on "Edit"
    end

    expect(current_path).to eq("/trips/1/edit")
  end
end

