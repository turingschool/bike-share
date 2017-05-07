require_relative '../spec_helper'

RSpec.describe "user can click the submit button on a form" do
  it "will redirect to the page for that individual trip" do
    city = City.create(name: "Washington DC")
    City.create(name: "Tokyo")
    city.stations.create!(name: "MLK", dock_count: 32, installation_date: "1774-5-24")
    city.stations.create!(name: "Malcom X", dock_count: 32, installation_date: "1774-5-24")
    Customer.create(name: "Customer")
    Customer.create(name: "Subscriber")

    visit('/trips/new')
    fill_in "trip[duration]", with: 300
    #these fill ins for the date probably wont work
    fill_in "trip[start_date]", with: "1776-9-12"
    fill_in "trip[end_date]", with: "1776-9-12"
    select("Malcom X", :from => "trip[end_station]")
    select("MLK", :from => "trip[start_station]")
    fill_in "trip[bike_id]", with: 13
    fill_in "trip[zip_code]", with: 80218
    

    click_on "Submit"

    expect(current_path).to eq("/trips/1")
    expect(page).to have_content("Malcom X")
    expect(page).to have_content("MLK")
  end
end
