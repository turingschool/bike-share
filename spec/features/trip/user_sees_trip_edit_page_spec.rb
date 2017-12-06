require 'spec_helper'

describe "when user visits /trips/:id/edit path" do
  before(:each) do
    @trip = Trip.create(duration: 35,
      start_date: DateTime.now,
      start_station_name: "Japan",
      start_station_id: 5,
      end_date: DateTime.now,
      end_station_name: "Narita",
      end_station_id: 7,
      bike_id: 105,
      subscription_type: "Subscriber")
  end

  it "sees an Edit Trip page with appropriate header" do
    visit '/trips/1/edit'

    expect(page).to have_content("Edit Trip")
  end

  it "sees a header bar with links to Trips, Stations,
      Station Dashboard, Trip Dashboard, and Home" do
    visit '/trips/1/edit'

    expect(page).to have_link("Home", :href=>'/')
    expect(page).to have_link("Trips", :href=>'/trips')
    expect(page).to have_link("Stations", :href=>'/stations')
    expect(page).to have_link("Station Dashboard", :href=>'/stations-dashboard')
    expect(page).to have_link("Trip Dashboard", :href=>'/trips-dashboard')
  end

  it "sees a table with a column describing each input field" do
    visit '/trips/1/edit'

    expect(page).to have_content("Duration")
    expect(page).to have_content("Start Date")
    expect(page).to have_content("End Date")
    expect(page).to have_content("Start Station")
    expect(page).to have_content("End Station")
    expect(page).to have_content("Bike ID")
    expect(page).to have_content("Subscription Type")
    expect(page).to have_content("Zipcode")
  end

  it "sees a Submit button that when clicked redirects user to that trip's show page" do
    visit '/trips/1/edit'

    fill_in "trip[duration]", with: 55

    click_button("submit-button")

    expect(page).to have_content(55)
    expect(current_path).to eq("/trips/1")
  end

end
