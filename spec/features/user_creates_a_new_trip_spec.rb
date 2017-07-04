RSpec.describe "User creates a trip" do
  it "with valid attributes" do

    visit('/trips/new')

    save_and_open_page

    fill_in("trip[duration]", with: 63)
    fill_in("trip[start_date]", with: 8/29/2013)
    fill_in("trip[start_station_id]", with: 66)
    fill_in("trip[end_date]", with: 8/29/2013)
    fill_in("trip[end_station_id]", with: 66)
    fill_in("trip[bike_id]", with: 520)
    fill_in("trip[subscription_id]", with: 1)
    fill_in("trip[zip_code]", with: 94127)

    click_button("Create Trip")

    trip = Trip.last
    expect(current_path).to eq("/trips")
    expect(page).to have_content("Duration: 63")
    expect(page).to have_content("Start Date: 8/29/2013 14:13")
    expect(page).to have_content("Start Station ID: 66")
    expect(page).to have_content("End Date: 8/29/2013 14:14")
    expect(page).to have_content("End Station ID: 66")
    expect(page).to have_content("Bike ID: 520")
    expect(page).to have_content("Subscription ID: 1")
    expect(page).to have_content("Zip Code: 90210")
  end
end
