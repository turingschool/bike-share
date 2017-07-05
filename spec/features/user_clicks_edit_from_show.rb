RSpec.describe "User clicks edit button" do
  it "on the individual trip page" do
    start_date_1 = DateTime.new(2013, 8, 29, 7, 13)
    end_date_1 = DateTime.new(2013, 8, 29, 7, 14)

    Trip.create(duration: 63, start_date: start_date_1, start_station_id: 66, end_date: end_date_1, end_station_id: 66, bike_id: 520, subscription_id: 1)

    visit('/trips/1')
    save_and_open_page

    click_button("Edit This Trip")

    expect(current_path).to eq("/trips/1/edit")
  end
end
