require 'spec_helper'

describe "when I visit '/trip/show' page" do
  before :each do
    @station_1 = Station.create(name: "SF", dock_count: 5,
    city: "San Francisco", installation_date: "2013-08-23")
    @station_2 = Station.create(name: "CO", dock_count: 4, city: "Denver",
    installation_date: "2013-08-14")
    @trip_1 = Trip.create(duration: 63, start_date: "2013-08-29", start_station_id: 1,
    start_station_name: "Embarcadero", end_date: "2013-08-29", end_station_id: 2,
    end_station_name: "Market St", bike_id: 520, subscription_type: "Subscriber",
    zip_code: 94127)

    visit '/trips/1'
  end

  it "I expect to see attributes of the trip" do
    expect(page.status_code).to eq(200)

    expect(page).to have_content(63)
    expect(page).to have_content("2013-08-29")
    expect(page).to have_content("2013-08-29")
    expect(page).to have_content(520)
    expect(page).to have_content("Subscriber")
    expect(page).to have_content(94127)
  end

  it "I expect to be able to edit a trip" do
    click_link("Edit")

    expect(current_path).to eq('/trips/1/edit')
  end

  it "I expect to ba able to delete a trip" do
    click_button("Delete")

    expect(current_path).to eq('/trips')
  end

end
