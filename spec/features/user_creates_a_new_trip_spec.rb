RSpec.describe "User creates a trip" do
  it "with valid attributes" do

    visit('/trips/new')

    save_and_open_page

    fill_in("trip[duration]", with: 30)
    fill_in("trip[start_date]", with: "6/12/16")
    fill_in("trip[start_station_id]", with: 34)
    fill_in("trip[end_date]", with: "6/12/16")
    fill_in("trip[end_station_id]", with: 5)
    fill_in("trip[bike_id]", with: 12)
    fill_in("trip[subscription_type_id]", with: 1)
    fill_in("trip[zipcode]", with: 90210)

    click_button("Create Trip")

    trip = Trip.last
    expect(current_path).to eq("/trips")
    expect(page).to have_content("Duration: 30")
    expect(page).to have_content("Start Date: 6/12/16")
    expect(page).to have_content("Start Station ID: 34")
    expect(page).to have_content("End Date: 6/12/16")
    expect(page).to have_content("End Station ID: 5")
    expect(page).to have_content("Bike ID: 12")
    expect(page).to have_content("Subscription Type ID: 1")
    expect(page).to have_content("Zip Code: 90210")
  end
end
