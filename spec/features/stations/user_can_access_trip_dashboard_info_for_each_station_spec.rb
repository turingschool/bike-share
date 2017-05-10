require './spec/spec_helper'

RSpec.describe "when a user visits the view station page" do
  before do
    city_1 = City.create(name: "squeevillia")
    zipcode_1 = Zipcode.create(zipcode: "11111")
    zipcode_2 = Zipcode.create(zipcode: "22222")
    zipcode_3 = Zipcode.create(zipcode: "33333")
    Station.create(
                  name: "something",
                  dock_count: 1,
                  city_id: 1,
                  installation_date: Date.strptime("08/30/2013",'%m/%d/%Y'),
                  longitude: 1.1,
                  latitude: -1.1
    )
    Station.create(
                  name: "something else",
                  dock_count: 3,
                  city_id: 1,
                  installation_date: Date.strptime("08/30/2015",'%m/%d/%Y'),
                  longitude: 1,
                  latitude: -2
    )
    Station.create(
                  name: "awesome",
                  dock_count: 3,
                  city_id: 1,
                  installation_date: Date.strptime("08/30/2014",'%m/%d/%Y'),
                  longitude: 2,
                  latitude: -2
    )
    Trip.create(
                duration: 63,
                start_date: DateTime.strptime("08/30/2013 11:11", "%m/%d/%Y %H:%M"),
                start_station_id: 1,
                end_date: DateTime.strptime("08/30/2013 11:12", "%m/%d/%Y %H:%M"),
                end_station_id: 1,
                bike_id: 1,
                subscription_type: "Subscriber",
                zipcode_id: 1
    )
    Trip.create(
                duration: 70,
                start_date: DateTime.strptime("05/29/2014 12:42", "%m/%d/%Y %H:%M"),
                start_station_id: 2,
                end_date: DateTime.strptime("05/29/2014 12:43", "%m/%d/%Y %H:%M"),
                end_station_id: 2,
                bike_id: 2,
                subscription_type: "Customer",
                zipcode_id: 2
    )
    Trip.create(
                duration: 71,
                start_date: DateTime.strptime("01/01/2015 10:16", "%m/%d/%Y %H:%M"),
                start_station_id: 1,
                end_date: DateTime.strptime("01/01/2015 10:17", "%m/%d/%Y %H:%M"),
                end_station_id: 2,
                bike_id: 1,
                subscription_type: "Subscriber",
                zipcode_id: 3
    )
  end

  it "loads the appropriate descriptions and calculations" do
    visit('/stations/1')

    expect(page).to have_content("Number of Rides Started Here: 2")
    expect(page).to have_content("Number of Rides Ended Here: 1")
    expect(page).to have_content("Most Frequent Destination From Here: something")
    expect(page).to have_content("Most Frequent Origination To Here: something")
    expect(page).to have_content("Busiest Trip Origination Date: 08/30/2013")
    expect(page).to have_content("Most Frequent Zip Code of Users Starting Here: 11111")
    expect(page).to have_content("Most Frequent Bike ID Starting Here: 1")
  end
end
