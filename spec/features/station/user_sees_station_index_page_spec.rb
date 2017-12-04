require "spec_helper"

describe "when user visits /stations path" do
  it "sees a station index page with all station names listed" do
    visit '/stations'


    expect(page).to have_content("Stations")
  end

  it "sees station links to dashboard, new station, and homepage" do
    visit '/stations'

    expect(page).to have_link("Station Dashboard", :href=>"/stations-dashboard")
    expect(page).to have_link("New Station", :href=>"/stations/new")
    expect(page).to have_link("Home", :href=>"/")
  end

  it "sees a created station with edit and delete buttons" do
    station = Station.create(name: "Station 1",
                             dock_count: 5,
                             city: "Denver",
                             installation_date: "8/5/17")
    visit '/stations'

    expect(page).to have_content(station.name)
    expect(page).to have_link("Edit", :href=>"/stations/#{station.id}/edit")
    # expect {click_button("delete") }.to change(Station, :count).by(-1)
  end

end
