require_relative '../../spec_helper'

RSpec.describe "When a user visits the trips dashboard" do
  it "can find data analysis about trips" do
    Trip.create(duration: 420,
                    start_date: "02/01/2017",
                    end_date: "02/01/2017",
                    subscription: "Customer",
                    zipcode: "80602",
                    start_station_id: 44,
                    end_station_id: 55,
                    bike_id: 555
                    )
    Trip.create(duration: 325,
                    start_date: "01/01/2017",
                    end_date: "01/01/2017",
                    subscription: "Subscriber",
                    zipcode: "80215",
                    start_station_id: 31 ,
                    end_station_id: 70,
                    bike_id: 312
                    )

    visit '/trips-dashboard'

    expect(page).to have_content("Trip Dashboard")
  end

  it "gets presented with date with the lowest number of trips" do
    Trip.create(duration: 420,
                    start_date: "02/01/2017",
                    end_date: "02/01/2017",
                    subscription: "Customer",
                    zipcode: "80602",
                    start_station_id: 44 ,
                    end_station_id: 55,
                    bike_id: 555
                    )
    Trip.create(duration: 325,
                    start_date: "01/01/2017",
                    end_date: "01/01/2017",
                    subscription: "Subscriber",
                    zipcode: "80215",
                    start_station_id: 31 ,
                    end_station_id: 70,
                    bike_id: 312
                    )

    visit '/trips-dashboard'
    
    expect(page).to have_content("Single date with the lowest number of trips with a count of those trips")
  end
end

# visit "/stations-dashboard"
#
# within('tr:nth-of-type(5)') do
#   within('td:nth-of-type(1)') do
#     expect(page).to have_content("Station with Most Ending Rides")
