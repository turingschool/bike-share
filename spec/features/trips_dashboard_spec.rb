require './app/models/trip'


RSpec.describe "User visits '/trip_dashboard'" do
  it "average duration of trip" do
    Trip.create(duration: "30", start_date: "8/5/2013", start_station_name: "San Fran", end_date: "8/6/2013",
        end_station_name: "Somewhere", bike_id: "520", subscription_type: "Subscriber", zip_code: "12345")
    Trip.create(duration: "40", start_date: "8/5/2013", start_station_name: "San Fran", end_date: "8/6/2013",
        end_station_name: "Somewhere", bike_id: "520", subscription_type: "Subscriber", zip_code: "12345")

    visit '/trip-dashboard'

    expect(page).to have_content("35")
  end

  it "shows longest ride" do
    Trip.create(duration: "30", start_date: "8/5/2013", start_station_name: "San Fran", end_date: "8/6/2013",
        end_station_name: "Somewhere", bike_id: "520", subscription_type: "Subscriber", zip_code: "12345")
    Trip.create(duration: "40", start_date: "8/5/2013", start_station_name: "San Fran", end_date: "8/6/2013",
        end_station_name: "Somewhere", bike_id: "520", subscription_type: "Subscriber", zip_code: "12345")

    visit '/trip-dashboard'

    expect(page).to have_content("40")
  end

  it "shows shortest ride" do
    Trip.create(duration: "30", start_date: "8/5/2013", start_station_name: "San Fran", end_date: "8/6/2013",
        end_station_name: "Somewhere", bike_id: "520", subscription_type: "Subscriber", zip_code: "12345")
    Trip.create(duration: "40", start_date: "8/5/2013", start_station_name: "San Fran", end_date: "8/6/2013",
        end_station_name: "Somewhere", bike_id: "520", subscription_type: "Subscriber", zip_code: "12345")

    visit '/trip-dashboard'

    expect(page).to have_content("30")
  end
end
