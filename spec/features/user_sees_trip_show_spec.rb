require "spec_helper"

RSpec.describe "When a user visits '/trips/:id'" do

  let(:trip) do
    Trip.create!(
      duration: 63,
      start_date: DateTime.new(2013,8,28,14,14),
      start_station_name: "Station 1",
      start_station_id: 1,
      end_date: DateTime.new(2013,8,29,14,14),
      end_station_name: "Station 2",
      end_station_id: 2,
      bike_id: 520,
      subscription_type: "Subscriber",
      zip_code: 94127
    )
  end

  before do
    visit "/trips/#{trip.id}"
  end

  it "they see a duration" do
    expect(page).to have_content("Duration: 63")
  end

  it "they see start date" do
    expect(page).to have_content("Start Date: 08/28/2013")
  end

  it "they see start station name" do
    expect(page).to have_content("Start Station Name: Station 1")
  end

  it "they see end date" do
    expect(page).to have_content("End Date: 08/29/2013")
  end

  it "they see end station name" do
    expect(page).to have_content("End Station Name: Station 2")
  end

  it "they see bike id" do
    expect(page).to have_content("Bike ID: 520")
  end

  it "they see subscription type" do
    expect(page).to have_content("Subscription Type: Subscriber")
  end

  it "they see zip code" do
    expect(page).to have_content("Zip Code: 94127")
  end
end
