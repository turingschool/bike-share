require_relative '../spec_helper'

RSpec.describe "when a user visits /trips" do
  it "they see first 30 trips" do
    Station.create(name: "Union Station", dock_count: 12, installation_date: "15/5/16", city_id: 1)
    Bike.create(bike_number: 23)
    Trip.create(duration: 63, start_date: "23/8/2014", start_station_id: 1, end_date: "23/8/2014", end_station_id: 1, bike_id: 1, subscription_type_id: 2, zip_code_id: 1)
    visit '/trips'

    within("h1.title") do
      expect(page).to have_content("Trips")
    end

    #come back to me
      expect(page).to have_content("1")
      expect(page).to have_content("63 minutes")
      expect(page).to have_content("2014-08-23")
      expect(page).to have_content("Union Station")
      expect(page).to have_content("23")
  end

  it "they can edit that trip" do
    Station.create(name: "Union Station", dock_count: 12, installation_date: "15/5/16", city_id: 1)
    Bike.create(bike_number: 23)
    ZipCode.create(zip_code: 80210)
    Trip.create(duration: 63, start_date: "23/8/2014", start_station_id: 1, end_date: "23/8/2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1, zip_code_id: 1)
    SubscriptionType.create(subscription_type: "Subscriber")
    visit '/trips'

    within "#edit-button button" do
      click_on "Edit"
    end

    expect(current_path).to eq("/trips/1/edit")
  end

  it "they can delete that trip" do
    Station.create(name: "Union Station", dock_count: 12, installation_date: "15/5/16", city_id: 1)
    Bike.create(bike_number: 23)
    ZipCode.create(zip_code: 80210)
    Trip.create(duration: 63, start_date: "23/8/2014", start_station_id: 1, end_date: "23/8/2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1, zip_code_id: 1)
    SubscriptionType.create(subscription_type: "Subscriber")
    visit '/trips'

    click_on "Delete"

    expect(current_path).to eq("/trips")

    within("table") do
      expect(page).not_to have_content("1")
    end
  end
end
