require_relative '../spec_helper'

RSpec.describe "when a user visits /stations/:id" do
  it "they see a single station's info" do
    City.create(name:"San Jose")
    Station.create(name: "Union Station", dock_count: 12, installation_date: "15/5/2016", city_id: 1)
    Station.create(name: "Penn Station", dock_count: 12, installation_date: "15/5/2016", city_id: 1)
    Bike.create(bike_number: 23)
    Bike.create(bike_number: 25)
    ZipCode.create(zip_code: 80210)
    Trip.create(duration: 60, start_date: "24/9/2014", start_station_id: 1, end_date: "23/9/2014", end_station_id: 2, bike_id: 1, subscription_type_id: 1, zip_code_id: 1)
    Trip.create(duration: 40, start_date: "23/9/2014", start_station_id: 1, end_date: "23/9/2014", end_station_id: 1, bike_id: 2, subscription_type_id: 1, zip_code_id: 1)
    Trip.create(duration: 40, start_date: "23/9/2014", start_station_id: 1, end_date: "23/9/2014", end_station_id: 2, bike_id: 2, subscription_type_id: 1, zip_code_id: 1)
    visit '/stations/1'

    within("h1.title") do
      expect(page).to have_content("Union Station")
    end

      expect(page).to have_content("Bike Capacity: 12")
      expect(page).to have_content("Installation Date: 2016-05-15")
      expect(page).to have_content("City: San Jose")
      expect(page).to have_content("Number of Rides starting from this station: 3")
      expect(page).to have_content("Number of Rides ending at this station: 1")
      expect(page).to have_content("Most frequent destination station: Penn Station")
      expect(page).to have_content("Most frequent origination station: Union Station")
      expect(page).to have_content("Busiest Day: 2014-09-23")
      expect(page).to have_content("Most frequent customer zip code: 80210")
      expect(page).to have_content("Most frequently used bike: 25")

  end

  it "they can delete that station" do
    City.create(name:"San Jose")
    Station.create(name: "Union Station", dock_count: 12, installation_date: "15/5/2016", city_id: 1)
    Station.create(name: "Penn Station", dock_count: 12, installation_date: "15/5/2016", city_id: 1)
    Bike.create(bike_number: 23)
    Bike.create(bike_number: 25)
    ZipCode.create(zip_code: 80210)
    Trip.create(duration: 60, start_date: "24/9/2014", start_station_id: 1, end_date: "23/9/2014", end_station_id: 2, bike_id: 1, subscription_type_id: 1, zip_code_id: 1)
    Trip.create(duration: 40, start_date: "23/9/2014", start_station_id: 1, end_date: "23/9/2014", end_station_id: 1, bike_id: 2, subscription_type_id: 1, zip_code_id: 1)
    Trip.create(duration: 40, start_date: "23/9/2014", start_station_id: 2, end_date: "23/9/2014", end_station_id: 2, bike_id: 2, subscription_type_id: 1, zip_code_id: 1)
    visit '/stations/1'

    click_on "Delete"

    expect(current_path).to eq("/stations")

    within("table") do
      expect(page).not_to have_content("Union Station")
    end
  end
end
