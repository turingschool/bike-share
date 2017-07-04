RSpec.describe "User visits '/trips/1'" do

  before :each do
    start_date = DateTime.new(2013, 8, 29, 7, 13)
    end_date = DateTime.new(2013, 8, 29, 7, 14)
    Trip.create(duration: 63, start_date: start_date, start_station_id: 66, end_date: end_date, end_station_id: 66, bike_id: 520, subscription_id: 1)
  end

  it "and sees duration" do
    visit('/trips/1')

    save_and_open_page

    expect(page).to have_content("Duration: 63")
  end

  it "and sees start date" do
    visit('/trips/1')

    save_and_open_page

    expect(page).to have_content("Start Date: 2013-08-29 07:13:00 UTC")
  end

  it "and sees start station id" do
    visit('/trips/1')

    save_and_open_page

    expect(page).to have_content("Start Station ID: 66")
  end

  it "and sees end date" do
    visit('/trips/1')

    save_and_open_page

    expect(page).to have_content("End Date: 2013-08-29 07:14:00 UTC")
  end

  it "and sees end station id" do
    visit('/trips/1')

    save_and_open_page

    expect(page).to have_content("End Station ID: 66")
  end

  it "and sees bike id" do
    visit('/trips/1')

    save_and_open_page

    expect(page).to have_content("Bike ID: 520")
  end

  it "and sees subscription id" do
    visit('/trips/1')

    save_and_open_page

    expect(page).to have_content("Subscription Type ID: 1")
  end
end
