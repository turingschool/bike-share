RSpec.describe "User visits '/trips'" do

  before :all do
    Trip.create(duration: 30, start_date: 6/12/16, start_station_id: 1, end_date: 6/14/16, end_station_id: 2, bike_id: 12, subscription_type_id: 1)
    Trip.create(duration: 45, start_date: 6/14/16, start_station_id: 12, end_date: 6/16/16, end_station_id: 12, bike_id: 12, subscription_type_id: 1)
  end

  it "and sees duration" do
    visit('/trips')

    save_and_open_page

    expect(page).to have_content("Duration: 30")
    expect(page).to have_content("Duration: 45")
  end
end
