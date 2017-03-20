require_relative "../spec_helper"


RSpec.describe "Creating a trip" do
  it "Can enter trip attributes" do
    City.create(name: "Denver")
    Station.create(name: "Downtown", installation_date: "20140331", city_id: "1", dock_count: 4)

    visit "/trips/new"
    fill_in "trip[start_date]", with: "2015-03-31"
    fill_in "start_station[name]", with: "Downtown"
    fill_in "trip[duration]", with: 45
    fill_in "trip[end_date]", with: "2015-03-31"
    fill_in "end_station[name]", with: "Downtown"
    fill_in "trip[bike_id]", with: 345
    fill_in "trip[subscription_type]", with: "Subscriber"
    fill_in "trip[zip_code]", with: 53211

    click_on "Create Trip"

    expect(current_path).to eq("/trips")

    # expect(page).to have_content("Trip from: Downtown on 2015-03-31 to Downtown")
    expect(page).to have_content("Bike ID: 345")
    expect(page).to have_content("Trip Duration (in minutes): 45")
    expect(page).to have_content("End Date: 2015-03-31")
    expect(page).to have_content("Subscription Type: Subscriber")
    expect(page).to have_content("Zipcode: 53211")

  end
end
