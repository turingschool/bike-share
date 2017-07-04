RSpec.describe "User visits '/trips'" do

  before :each do
    start_date_1 = DateTime.new(2013, 8, 29, 7, 13)
    end_date_1 = DateTime.new(2013, 8, 29, 7, 14)
    start_date_2 = DateTime.new(2013, 8, 29, 7, 43)
    end_date_2 = DateTime.new(2013, 8, 29, 7, 44)

    Trip.create(duration: 63, start_date: start_date_1, start_station_id: 66, end_date: end_date_1, end_station_id: 66, bike_id: 520, subscription_id: 1)
    Trip.create(duration: 70, start_date: start_date_2, start_station_id: 10, end_date: end_date_2, end_station_id: 10, bike_id: 661, subscription_id: 1)
  end

  it "and sees all trip durations" do
    visit('/trips')

    save_and_open_page

    expect(page).to have_content("Duration: 63")
    expect(page).to have_content("Duration: 70")
  end

  it "and sees all trip start dates" do
    visit('/trips')

    save_and_open_page

    expect(page).to have_content("Start Date: 2013-08-29 07:43:00 UTC")
  end

  it "and sees all trip start station ids" do
    visit('/trips')

    save_and_open_page

    expect(page).to have_content("Start Station ID: 66")
    expect(page).to have_content("Start Station ID: 10")
  end

  it "and sees all trip end dates" do
    visit('/trips')

    save_and_open_page

    expect(page).to have_content("End Date: 2013-08-29 07:44:00 UTC")
  end

  it "and sees all trip end station ids" do
    visit('/trips')

    save_and_open_page

    expect(page).to have_content("End Station ID: 66")
    expect(page).to have_content("End Station ID: 10")
  end

  it "and sees all trip bike ids" do
    visit('/trips')

    save_and_open_page

    expect(page).to have_content("Bike ID: 520")
    expect(page).to have_content("Bike ID: 661")
  end

  it "and sees all trip subscription type ids" do
    visit('/trips')

    save_and_open_page

    expect(page).to have_content("Subscription Type ID: 1")
    expect(page).to have_content("Subscription Type ID: 1")
  end
end
