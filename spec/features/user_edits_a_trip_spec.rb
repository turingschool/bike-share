RSpec.describe "User edits a trip" do
  it "with valid attributes" do
    Trip.create(duration: 30, start_date: "6/12/16", start_station_id: 1, end_date: "6/14/16", end_station_id: 2, bike_id: 12, subscription_type_id: 1)

    visit('/trips/1/edit')

    save_and_open_page

    fill_in("trip[duration]", with: 30)
    fill_in("trip[start_date]", with: "6/12/16")
    fill_in("trip[start_station_id]", with: 34)
    fill_in("trip[end_date]", with: "6/12/16")
    fill_in("trip[end_station_id]", with: 5)
    fill_in("trip[bike_id]", with: 12)
    fill_in("trip[subscription_type_id]", with: 1)
    fill_in("trip[zipcode]", with: 90210)

    duration      = find_field("trip[duration]").value.to_i
    start_date    = find_field("trip[start_date]").value
    start_station = find_field("trip[start_station_id]").value.to_i
    end_date      = find_field("trip[end_date]").value
    end_station   = find_field("trip[end_station_id]").value.to_i
    bike          = find_field("trip[bike_id]").value.to_i
    subscription  = find_field("trip[subscription_type_id]").value.to_i
    zip_code      = find_field("trip[zipcode]").value.to_i

    expect(duration).to eq(30)
    expect(start_date).to eq("6/12/16")
    expect(start_station).to eq(34)
    expect(end_date).to eq("6/12/16")
    expect(end_station).to eq(5)
    expect(bike).to eq(12)
    expect(subscription).to eq(1)
    expect(zip_code).to eq(90210)

    click_button("Submit Changes")

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
