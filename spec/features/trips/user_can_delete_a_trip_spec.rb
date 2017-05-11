require './spec/spec_helper'

RSpec.describe "When a user clicks delete" do

  it "deletes on the index" do
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
    trip = Trip.create(
                      duration: 240,
                      start_date: DateTime.strptime("08/30/2013 11:11",'%m/%d/%Y %H:%M'),
                      start_station_id: 1,
                      end_date: DateTime.strptime("08/30/2013 11:15",'%m/%d/%Y %H:%M'),
                      end_station_id: 1,
                      bike_id: 5,
                      subscription_type: "Subscriber",
                      zipcode_id: 1
    )

    visit('/trips')
    expect(page).to have_button("Delete")
    expect(Trip.all.count).to eq(1)
    click_button("Delete")

    expect(Trip.all.count).to eq(0)
    expect(page).to have_current_path("/trips")
    expect(page).to have_content("No trips available.")
  end

  it "deletes on the edit page" do
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
    trip = Trip.create(
                      duration: 240,
                      start_date: DateTime.strptime("08/30/2013 11:11",'%m/%d/%Y %H:%M'),
                      start_station_id: 1,
                      end_date: DateTime.strptime("08/30/2013 11:15",'%m/%d/%Y %H:%M'),
                      end_station_id: 1,
                      bike_id: 5,
                      subscription_type: "Subscriber",
                      zipcode_id: 1
    )

    visit("/trips/#{trip.id}/edit")
    expect(page).to have_button("Delete")
    expect(Trip.all.count).to eq(1)
    click_button("Delete")

    expect(Trip.all.count).to eq(0)
    expect(page).to have_current_path("/trips")
  end

  it "deletes on the show page" do
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
    trip = Trip.create(
                      duration: 240,
                      start_date: DateTime.strptime("08/30/2013 11:11",'%m/%d/%Y %H:%M'),
                      start_station_id: 1,
                      end_date: DateTime.strptime("08/30/2013 11:15",'%m/%d/%Y %H:%M'),
                      end_station_id: 1,
                      bike_id: 5,
                      subscription_type: "Subscriber",
                      zipcode_id: 1
    )

    visit('/trips/1')
    expect(page).to have_button("Delete")
    expect(Trip.all.count).to eq(1)
    click_button("Delete")

    expect(Trip.all.count).to eq(0)
    expect(page).to have_current_path("/trips")
  end
end
