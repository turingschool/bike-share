require './spec/spec_helper'

RSpec.describe "When a user visits the view individual trip page" do
  before do
    city_1 = City.create(name: "something")
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
  end

  it "they can view information about a trip" do
    #visit("/trips") Click Button view trip...
    visit("/trips/#{@trip.id}")
    expect(page).to have_content("Trip Info")
    expect(page).to have_content("Duration: 60")
    expect(page).to have_content("Start Date: 08/30/2013 11:11")
    expect(page).to have_content("Start Station: something")
    expect(page).to have_content("End Date: 08/30/2013 11:12")
    expect(page).to have_content("End Station: something")
    expect(page).to have_content("Bike ID: 1")
    expect(page).to have_content("Subscription Type: Subscriber")
    expect(page).to have_content("Edit Trip")
    expect(page).to have_selector(".btn-edit")
    expect(page).to have_selector("form .btn-delete")

  end
end
