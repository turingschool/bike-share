require 'spec_helper'

describe "when user visits /trips/:id show page" do
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

  it "sees a single trip with its associated attributes" do
    visit '/trips/1'

    expect(page).to have_content("Duration")
    expect(page).to have_content(35)
    expect(page).to have_content("Start Station ID")
    expect(page).to have_content(5)
    expect(page).to have_content("Subscription Type")
    expect(page).to have_content("Subscriber")
  end

  it "sees links back to Trip Index, Trip Dashboard, Station Dashboard, Station Index, and Home" do
    visit '/trips/1'

    expect(page).to have_link("Trips", :href=>'/trips')
    expect(page).to have_link("Stations", :href=>'/stations')
    expect(page).to have_link("Trip Dashboard", :href=>'/trips-dashboard')
    expect(page).to have_link("Station Dashboard", :href=>'/stations-dashboard')
    expect(page).to have_link("Home", :href=>'/')
  end

end
