RSpec.describe "User deletes a trip" do
  it "from all trips page" do

    start_date_1 = DateTime.new(2013, 8, 29, 7, 13)
    end_date_1 = DateTime.new(2013, 8, 29, 7, 14)
    start_date_2 = DateTime.new(2013, 8, 29, 7, 43)
    end_date_2 = DateTime.new(2013, 8, 29, 7, 44)

    Trip.create(duration: 63, start_date: start_date_1, start_station_id: 66, end_date: end_date_1, end_station_id: 66, bike_id: 520, subscription_id: 1)
    Trip.create(duration: 70, start_date: start_date_2, start_station_id: 10, end_date: end_date_2, end_station_id: 10, bike_id: 661, subscription_id: 1)

    visit('/trips')

    save_and_open_page

    click_button("Delete Trip 1")

    expect(current_path).to eq('/trips')
    expect(page).to_not have_content('Trip 1')
  end

  it "from individual trips page" do

    start_date_1 = DateTime.new(2013, 8, 29, 7, 13)
    end_date_1 = DateTime.new(2013, 8, 29, 7, 14)
    start_date_2 = DateTime.new(2013, 8, 29, 7, 43)
    end_date_2 = DateTime.new(2013, 8, 29, 7, 44)

    Trip.create(duration: 63, start_date: start_date_1, start_station_id: 66, end_date: end_date_1, end_station_id: 66, bike_id: 520, subscription_id: 1)
    Trip.create(duration: 70, start_date: start_date_2, start_station_id: 10, end_date: end_date_2, end_station_id: 10, bike_id: 661, subscription_id: 1)

    visit('/trips/1')

    save_and_open_page

    click_button("DELETE THIS TRIP")

    expect(current_path).to eq('/trips')
    expect(page).to_not have_content('Trip 1')
  end
end
