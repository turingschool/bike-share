RSpec.describe "User creates a trip" do
  it "with valid attributes" do

    visit('/trips/new')
    start_date = DateTime.new(2013, 8, 29, 7, 13)
    end_date = DateTime.new(2013, 8, 29, 7, 14)
    fill_in("trip[duration]", with: 63)
    fill_in("trip[start_date]", with: start_date)
    fill_in("trip[start_station_id]", with: 66)
    fill_in("trip[end_date]", with: end_date)
    fill_in("trip[end_station_id]", with: 66)
    fill_in("trip[bike_id]", with: 520)
    fill_in("trip[subscription_id]", with: 1)
    fill_in("trip[zip_code]", with: 94127)

    click_button("Create Trip")

    expect(current_path).to eq("/trips")
    expect(page).to have_content("Duration: 63")
    expect(page).to have_content("Start Date: 2013-08-29 07:13:00 UTC")
    expect(page).to have_content("Start Station ID: 66")
    expect(page).to have_content("End Date: 2013-08-29 07:14:00 UTC")
    expect(page).to have_content("End Station ID: 66")
    expect(page).to have_content("Bike ID: 520")
    expect(page).to have_content("Subscription Type ID: 1")
    expect(page).to have_content("Zip Code: 94127")
  end
end
