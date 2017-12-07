require 'spec_helper'

describe 'As a user' do
  describe 'when i visit /trips-dashboard' do
    before :each do
      @station_1 = Station.create(name: "SF", dock_count: 5,
      city: "San Francisco", installation_date: "2013-08-23")
      @station_2 = Station.create(name: "CO", dock_count: 4, city: "Denver",
      installation_date: "2013-08-14")
      @station_3 = Station.create(name: "WI", dock_count: 3, city: "Madison",
      installation_date: "2013-08-06")
      @station_4 = Station.create(name: "The Bay", dock_count: 25,
        city: "San Francisco", installation_date: "2013-08-14")

      @trip_1 = Trip.create(duration: 63, start_date: "2013-08-29", start_station_id: 1,
      start_station_name: "Embarcadero", end_date: "2013-08-30", end_station_id: 2,
      end_station_name: "Market St", bike_id: 520, subscription_type: "Subscriber",
      zip_code: 94127)
      @trip_2 = Trip.create(duration: 53, start_date: "2013-02-27", start_station_id: 2,
      start_station_name: "SFO", end_date: "2013-02-27", end_station_id: 1,
      end_station_name: "Mission District", bike_id: 510, subscription_type: "Customer",
      zip_code: 94105)
      @trip_3 = Trip.create(duration: 43, start_date: "2014-06-22", start_station_id: 2,
      start_station_name: "Turing", end_date: "2014-08-18", end_station_id: 4,
      end_station_name: "Union Station", bike_id: 510, subscription_type: "Subscriber",
      zip_code: 94128)
      @trip_4 = Trip.create(duration: 33, start_date: "2014-06-22", start_station_id: 2,
      start_station_name: "Capitol Hill", end_date: "2014-06-22", end_station_id: 4,
      end_station_name: "Red Rocks", bike_id: 550, subscription_type: "Subscriber",
      zip_code: 94105)

      @condition = Condition.create(date: "2014-06-22", max_temperature_f: 70,
      mean_temperature_f: 60, min_temperature_f: 50, mean_humidity: 20,
      mean_visibility_miles: 50, mean_wind_speed_mph: 12, precipitation_inches: 4,
      zip_code: 94127)

      visit '/trips/dashboard'
    end

    it 'I see trip data for all trips' do
      expect(page.status_code).to eq(200)

      expect(page).to have_content(48)
      expect(page).to have_content(63)
      expect(page).to have_content(33)
      expect(page).to have_content("CO")
      expect(page).to have_content("The Bay")
      expect(page).to have_content(1)
      expect(page).to have_content(2)
      expect(page).to have_content(510)
      expect(page).to have_content(520)
      expect(page).to have_content(3)
      expect(page).to have_content(25.0)
      expect(page).to have_content(75.0)
      expect(page).to have_content("2014-06-22")
      expect(page).to have_content("2013-02-27")
    end
  end
end
