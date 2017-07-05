RSpec.describe "User deletes a trip" do
  it "from all trips page" do
    Trip.create(duration: 30, start_date: "6/12/16", start_station_id: 1, end_date: "6/14/16", end_station_id: 2, bike_id: 12, subscription_type_id: 1)
    Trip.create(duration: 45, start_date: "6/14/16", start_station_id: 12, end_date: "6/16/16", end_station_id: 12, bike_id: 22, subscription_type_id: 1)

    visit('/trips')

    click_button("Delete Trip 1")

    expect(current_path).to eq('/trips')
    expect(page).to_not have_content('Trip 1')
  end
end
