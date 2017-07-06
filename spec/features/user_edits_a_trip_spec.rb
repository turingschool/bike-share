RSpec.describe "User edits a trip" do
  it "with valid attributes" do

    start_date_1 = DateTime.new(2013, 8, 29, 7, 13)
    end_date_1 = DateTime.new(2013, 8, 29, 7, 14)

    Trip.create(duration: 63, start_date: start_date_1, start_station_id: 66, end_date: end_date_1, end_station_id: 66, bike_id: 520, subscription_id: 1)

    visit('/trips/1/edit')

    save_and_open_page

    start_date_2 = DateTime.new(2013, 8, 29, 7, 43)
    end_date_2 = DateTime.new(2013, 8, 29, 7, 44)

    fill_in("trip[duration]", with: 30)
    fill_in("trip[start_date]", with: start_date_2)
    fill_in("trip[start_station_id]", with: 34)
    fill_in("trip[end_date]", with: end_date_2)
    fill_in("trip[end_station_id]", with: 5)
    fill_in("trip[bike_id]", with: 26)
    fill_in("trip[subscription_id]", with: 1)
    fill_in("trip[zip_code]", with: 95138)

    duration      = find_field("trip[duration]").value.to_i
    start_date    = find_field("trip[start_date]").value
    start_station = find_field("trip[start_station_id]").value.to_i
    end_date      = find_field("trip[end_date]").value
    end_station   = find_field("trip[end_station_id]").value.to_i
    bike          = find_field("trip[bike_id]").value.to_i
    subscription  = find_field("trip[subscription_id]").value.to_i
    zip_code      = find_field("trip[zip_code]").value.to_i

    expect(duration).to eq(30)
    expect(start_date).to eq("2013-08-29T07:43:00+00:00")
    expect(start_station).to eq(34)
    expect(end_date).to eq("2013-08-29T07:44:00+00:00")
    expect(end_station).to eq(5)
    expect(bike).to eq(26)
    expect(subscription).to eq(1)
    expect(zip_code).to eq(95138)

    click_button("Submit Changes")

    save_and_open_page

    trip = Trip.last
    expect(current_path).to eq("/trips")
    expect(page).to have_content("Duration: 30")
    expect(page).to have_content("Start Date: 2013-08-29 07:43:00 UTC")
    expect(page).to have_content("Start Station ID: 34")
    expect(page).to have_content("End Date: 2013-08-29 07:44:00 UTC")
    expect(page).to have_content("End Station ID: 5")
    expect(page).to have_content("Bike ID: 26")
    expect(page).to have_content("Subscription Type ID: 1")
    expect(page).to have_content("Zip Code: 95138")
  end
end
