require './spec/spec_helper'

RSpec.describe "when a user visits the new trip page" do
  it "they can create a new trip" do
    city_1 = City.create(name: "squeevillia")
    city_2 = City.create(name: "rhondarhiffic")
    city_3 = City.create(name: "chrissable")
    city_4 = City.create(name: "adamtastic")
    Station.create(
                  name: "something",
                  dock_count: 1,
                  city_id: 1,
                  installation_date: Date.strptime("08/30/2013",'%m/%d/%Y'),
                  longitude: -121.9,
                  latitude: 30.7
    )
    zipcode = Zipcode.create(zipcode: 94127)
    expect(Trip.all.count).to eq(0)

    visit('/trips/new')
    expect(page).to have_content("Add a new trip")
    fill_in("trip[duration]", with: 840)
    fill_in("trip[start_date]", with: "08/30/2013 12:45")
    select "squeevillia", :from => "trip[start_station_id]"
    fill_in("trip[end_date]", with: "08/30/2013 12:59")
    select "squeevillia", :from => "trip[end_station_id]"
    fill_in("trip[bike_id]", with: 500)
    select "Subscriber", :from => "trip[subscription_type]"
    select "94127", :from => "trip[zipcode_id]"

    click_button("Create Trip")

    expect(Trip.all.count).to eq(1)
    expect(page).to have_current_path("/trips/1")
    expect(page).to have_content("Start Station: squeevillia")
    expect(page).to have_content("Bike ID: 500")
  end
end
