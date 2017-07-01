RSpec.describe "User visits '/trips'" do

  before :each do
    Trip.create(duration: 30, start_date: 6/12/16, start_station_id: 1, end_date: 6/14/16, end_station_id: 2, bike_id: 12, subscription_type_id: 1)
    Trip.create(duration: 45, start_date: 6/14/16, start_station_id: 12, end_date: 6/16/16, end_station_id: 12, bike_id: 22, subscription_type_id: 1)
  end

  it "and sees all trip durations" do
    visit('/trips')

    save_and_open_page

    expect(page).to have_content("Duration: 30")
    expect(page).to have_content("Duration: 45")
  end

  it "and sees all trip start dates" do
    visit('/trips')

    save_and_open_page

    expect(page).to have_content("Start Date: 6/12/16")
    expect(page).to have_content("Start Date: 6/14/16")
  end

  it "and sees all trip start station ids" do
    visit('/trips')

    save_and_open_page

    expect(page).to have_content("Start Station ID: 1")
    expect(page).to have_content("Start Station ID: 12")
  end

  it "and sees all trip end dates" do
    visit('/trips')

    save_and_open_page

    expect(page).to have_content("End Date: 6/14/16")
    expect(page).to have_content("End Date: 6/16/16")
  end

  it "and sees all trip end station ids" do
    visit('/trips')

    save_and_open_page

    expect(page).to have_content("End Station ID: 2")
    expect(page).to have_content("End Station ID: 12")
  end

  it "and sees all trip bike ids" do
    visit('/trips')

    save_and_open_page

    expect(page).to have_content("Bike ID: 12")
    expect(page).to have_content("Bike ID: 22")
  end

  it "and sees all trip subscription type ids" do
    visit('/trips')

    save_and_open_page

    expect(page).to have_content("Subscription Type ID: 1")
    expect(page).to have_content("Subscription Type ID: 1")
  end
end
