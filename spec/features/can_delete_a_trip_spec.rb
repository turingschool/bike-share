require_relative '../spec_helper'

RSpec.describe "Clicking Delete removes trip" do
  it "Can delete trips from list" do
    Trip.create(duration: 103,
                start_date: "2013-08-09",
                start_station_id: 59,
                start_station_name: "Golden Gate at Polk",
                end_date: "2013-08-09",
                bike_id: 527,
                end_station_name: "Golden Gate at Polk",
                end_station_id: 59,
                subscription_type: "Subscriber"
                )

    visit "/trips"

    expect(page).to have_content("Golden Gate at Polk")

    click_on "Delete"

    expect(page).to_not have_content("Golden Gate at Polk")
  end

  it "Can delete trips from trip/id page" do
    Trip.create(duration: 103,
    start_date: "2013-08-09",
    start_station_id: 59,
    start_station_name: "Golden Gate at Polk",
    end_date: "2013-08-09",
    bike_id: 527,
    end_station_name: "Golden Gate at Polk",
    end_station_id: 59,
    subscription_type: "Subscriber"
    )

    visit "/trips/1"

    click_on "Delete"

    expect(current_path).to eq("/trips")
    expect(page).to_not have_content("Golden Gate at Polk")
  end
end
