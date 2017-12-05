require 'spec_helper'

describe "When user visits /trips-dashboard link" do
  before(:each) do
    @trip = Trip.create(duration: 35, start_date: DateTime.now,
      start_station_name: "Japan", start_station_id: 5,
      end_date: DateTime.now, end_station_name: "Narita",
      end_station_id: 7, bike_id: 105, subscription_type: "Subscriber")
    @trip2 = Trip.create(duration: 36,start_date: DateTime.now,
      start_station_name: "Japan", start_station_id: 5,
      end_date: DateTime.now, end_station_name: "Narita",
      end_station_id: 7, bike_id: 105,subscription_type: "Subscriber")
    @station = Station.create(name: "lee", dock_count: 50, city: "Denver", installation_date: DateTime.now)
  end

  it "sees page with appropriate header title and links" do
    visit '/trips-dashboard'

    expect(page).to have_content "Trip Dashboard"
    expect(page).to have_link "Trips", :href=>'/trips'
    expect(page).to have_link "Stations", :href=>'/stations'
    expect(page).to have_link "Station Dashboard", :href=>'/stations-dashboard'
    expect(page).to have_link "Home", :href=>'/'
  end

  it "sees tables with appropriate titles for data" do
    visit '/trips-dashboard'

    expect(page).to have_content "Average Ride Duration"
    expect(page).to have_content 35.5
    expect(page).to have_content "Station with most rides as ending place:"
    expect(page).to have_content "Date with most trips:"
    expect(page).to have_content "Least ridden bike ID:"
    expect(page).to have_content "User subscription breakout by percent:"
  end
end
