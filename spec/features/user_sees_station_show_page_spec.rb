require 'spec_helper'

describe "as a user when I visit station show page" do
  before :each do

    @station_1 = Station.create(name: "SF", dock_count: 5,
    city: "San Francisco", installation_date: "2013-08-23")
    @station_2 = Station.create(name: "CO", dock_count: 4, city: "Denver",
    installation_date: "2013-08-14")
    @station_3 = Station.create(name: "WI", dock_count: 3, city: "Madison",
    installation_date: "2013-08-06")
    @station_4 = Station.create(name: "The Bay", dock_count: 25, city: "San Francisco", installation_date: "2013-08-14")

    @trip_1 = Trip.create(duration: 63, start_date: "2013-08-29", start_station_id: @station_1.id,
    start_station_name: "Embarcadero", end_date: "2013-08-30", end_station_id: @station_2.id,
    end_station_name: "Market St", bike_id: 520, subscription_type: "Subscriber",
    zip_code: 94127)
    @trip_2 = Trip.create(duration: 53, start_date: "2013-02-27", start_station_id: @station_2.id,
    start_station_name: "SFO", end_date: "2013-02-27", end_station_id: @station_1.id,
    end_station_name: "Mission District", bike_id: 510, subscription_type: "Customer",
    zip_code: 94105)
    @trip_3 = Trip.create(duration: 43, start_date: "2014-06-22", start_station_id: @station_2.id,
    start_station_name: "Turing", end_date: "2014-08-18", end_station_id: @station_3.id,
    end_station_name: "Union Station", bike_id: 510, subscription_type: "Subscriber",
    zip_code: 94128)
    @trip_4 = Trip.create(duration: 33, start_date: "2014-06-22", start_station_id: @station_2.id,
    start_station_name: "Capitol Hill", end_date: "2014-06-22", end_station_id: @station_4.id,
    end_station_name: "Red Rocks", bike_id: 550, subscription_type: "Subscriber",
    zip_code: 94105)

    visit "/stations/#{@station_1.id}"
  end

  it "I see station show details" do
    expect(page.status_code).to eq(200)

    expect(page).to have_content("SF")
    expect(page).to have_content(5)
    expect(page).to have_content("San Francisco")
    expect(page).to have_content("2013-08-23")
    expect(page).to have_content("Edit")
  end

  it "I can edit the details" do
    click_link("Edit")

    expect(current_path).to eq("/stations/#{@station_1.id}/edit")
  end

  it "I can delete station and redirect to station index" do
    click_button("Delete")

    expect(current_path).to eq("/stations/index")
  end

  it "I can see number of rides started at this station" do
    expect(page).to have_content("Number of Rides started at #{@station_1.name}")
    expect(page).to have_content(1)
  end

  it "gives number of rides ended at this station" do
    expect(page).to have_content("Number of Rides ended at #{@station_1.name}")
    expect(page).to have_content(1)
  end

  it 'gives most frequent destination station' do
    expect(page).to have_content("Station that is the most frequent destination station from #{@station_1.name}")
    expect(page).to have_content("CO")
  end

  it 'gives the date with the highest number of trips started at this station' do
    expect(page).to have_content("Station that is the most frequent start station for trips that ends at #{@station_1.name}")
    expect(page).to have_content("CO")

  end

  it 'gives single date with highest number of trips with count of those trips that originate from this station' do
    expect(page).to have_content("Date with the highest number of trips started at #{@station_1.name}")
    expect(page).to have_content("2013-08-29")
  end

  it 'gives most frequent zipcode starting trips at a specific station' do
    expect(page).to have_content("Most frequent Zip Code for users starting trips at #{@station_1.name}")
    expect(page).to have_content(94127)
  end

  it 'gives most frequent bike id starting trips at a specific station' do
    expect(page).to have_content("Most frequent Bike ID for Bikes that starts trips at #{@station_1.name}")
    expect(page).to have_content(520)
  end
end
