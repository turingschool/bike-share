require_relative '../spec_helper'

RSpec.describe "Clicking Delete removes trip" do
  before :each do
    City.create(name: "Denver")
    SubscriptionType.create(flavor: "Subscriber")
    Station.create(name: "Downtown", installation_date: "20140331", city_id: "1", dock_count: 4)
    Trip.create(duration: 103,
                start_date: "2013-08-09",
                start_station_id: 1,
                end_date: "2013-08-09",
                bike_id: 527,
                end_station_id: 1,
                subscription_type_id: 1
                )

  end

  it "Can delete trips from list" do
    visit "/trips"

    expect(page).to have_content("Downtown")

    click_on "Delete"

    expect(page).to_not have_content("Downtown")
  end

  it "Can delete trips from trip/id page" do
    visit "/trips/1"

    click_on "Delete"

    expect(current_path).to eq("/trips")
    expect(page).to_not have_content("Downtown")
  end
end
