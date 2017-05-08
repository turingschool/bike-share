require './spec/spec_helper'

RSpec.describe "When a user edits a trip" do
  before do
    city_1 = City.create(name: "something")
    city_2 = City.create(name: "else")
    zipcode1 = Zipcode.create(zipcode: 99999)
    @trip = Trip.create(
                  duration: 60,
                  start_date: DateTime.strptime("08/30/2013 11:11", "%m/%d/%Y %H:%M"),
                  start_station_id: 1,
                  end_date: DateTime.strptime("08/30/2013 11:12", "%m/%d/%Y %H:%M"),
                  end_station_id: 1,
                  bike_id: 1,
                  subscription_type: "Subscriber"
    )
    Station.create(
                  name: "something",
                  dock_count: 1,
                  city_id: 1,
                  installation_date: Date.strptime("08/30/2013",'%m/%d/%Y'),
                  longitude: -121.9,
                  latitude: 30.7
    )
    Station.create(
                  name: "else",
                  dock_count: 1,
                  city_id: 1,
                  installation_date: Date.strptime("08/30/2013",'%m/%d/%Y'),
                  longitude: -121.9,
                  latitude: 30.7
    )
 end

  it "can edit the trip" do
    visit("/trips/#{@trip.id}/edit")
    expect(page).to have_content("Edit This Trip")
    fill_in("trip[duration]", with: 60)
    select "else", :from => "trip[start_station_id]"
    fill_in("trip[start_date]", with: "09/30/2013 12:40")
    select "else", :from => "trip[start_station_id]"
    fill_in("trip[end_date]", with: "09/30/2013 12:41")
    select "else", :from => "trip[end_station_id]"
    fill_in("trip[bike_id]", with: 600)
    select "Subscriber", :from => "trip[subscription_type]"
    select "99999", :from => "trip[zipcode_id]"

    click_button("Update Trip")

    expect(page).to have_current_path("/trips/1")
    expect(page).to have_content("Start Station: else")
    expect(page).to have_content("Bike ID: 600")
  end
end
