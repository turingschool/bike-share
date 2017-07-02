RSpec.describe "User visits '/trips/1'" do

  before :each do
    Trip.create(duration: 30, start_date: "6/12/16", start_station_id: 1, end_date: "6/14/16", end_station_id: 2, bike_id: 12, subscription_type_id: 1)
  end

  it "and sees duration" do
    visit('/trips/1')

    save_and_open_page

    expect(page).to have_content("Duration: 30")
  end

  it "and sees start date" do
    visit('/trips/1')

    save_and_open_page

    expect(page).to have_content("Start Date: 6/12/16")
  end

  it "and sees start station id" do
    visit('/trips/1')

    save_and_open_page

    expect(page).to have_content("Start Station ID: 1")
  end

  it "and sees end date" do
    visit('/trips/1')

    save_and_open_page

    expect(page).to have_content("End Date: 6/14/16")
  end

  it "and sees end station id" do
    visit('/trips/1')

    save_and_open_page

    expect(page).to have_content("End Station ID: 2")
  end

  it "and sees bike id" do
    visit('/trips/1')

    save_and_open_page

    expect(page).to have_content("Bike ID: 12")
  end

  it "and sees subscription id" do
    visit('/trips/1')

    save_and_open_page

    expect(page).to have_content("Subscription Type ID: 1")
  end
end
