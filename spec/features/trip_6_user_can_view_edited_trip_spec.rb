require_relative '../spec_helper'

RSpec.describe "user can fill in form" do
  it "it updates page with correct information" do
      city = City.create(name: "Washington DC")
      City.create(name: "Frankfurt")
      City.create(name: "Tokyo")
      city.stations.create!(name: "MLK", dock_count: 32, installation_date: "1984-05-24")
      city.stations.create!(name: "Malcom X", dock_count: 32, installation_date: "1984-05-24")
      customer = Customer.create(name: "Customer")
      customer.trips.create!(duration: 200,
                             start_date: "2000-8-12",
                             start_station_id: 1,
                             end_date: "2000-8-12",
                             end_station_id: 2,
                             bike_id: 13,
                             zip_code: 80220)

      visit('/trips/1/edit')
      fill_in "trip[duration]", with: 300
      #these fill ins for the date probably wont work
      select("Malcom X", :from => "trip[end_station]")
      select("MLK", :from => "trip[start_station]")
      fill_in "trip[bike_id]", with: 13
      fill_in "trip[zip_code]", with: 80218
      click_button "Submit changes"
      expect(current_path).to eq('/stations/1')
      expect(page).to have_content("Malcolm X")
      expect(page).to have_content("MLK")
  end
end
