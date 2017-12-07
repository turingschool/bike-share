require 'spec_helper'

describe "when user visits /trips path" do
  it "sees a trip index page with all trip IDs listed" do
    visit '/trips'

    expect(page).to have_content("All Trips")
  end

  it "sees links to trip dashboard, new trip, and homepage" do
    visit '/trips'

    expect(page).to have_link("Trip Dashboard", :href=>'/trips-dashboard')
    expect(page).to have_link("New Trip", :href=>'/trips/new')
    expect(page).to have_link("Home", :href=>'/')
  end

  it "sees each trip with a link to edit and a delete button" do
    trip = Trip.create(duration: 35,
                    start_date: DateTime.now,
                    start_station_name: "Japan",
                    start_station_id: 5,
                    end_date: DateTime.now,
                    end_station_name: "Narita",
                    end_station_id: 7,
                    bike_id: 105,
                    subscription_type: "Subscriber"
                    )
    visit '/trips'

    expect(page).to have_content(trip.bike_id)
    expect(page).to have_link("Edit", :href=>"/trips/#{trip.id}/edit")
    expect {click_button("delete")}.to change(Trip, :count).by(-1)
  end

end
