RSpec.describe "User deletes a trip" do
  it "from all trips page" do
    Trip.create(duration: 63, start_date: "8/29/2013 14:13", start_station_id: 66, end_date: "8/29/2013 14:14", end_station_id: 66, bike_id: 520, subscription_id: 1)
    Trip.create(duration: 70, start_date: "8/29/2013 14:42", start_station_id: 10, end_date: "8/29/2013 14:43", end_station_id: 10, bike_id: 661, subscription_id: 1)

    visit('/trips')

    # save_and_open_page

    click_button("Delete Trip 1")

    expect(current_path).to eq('/trips')
    expect(page).to_not have_content('Trip 1')
  end
end
