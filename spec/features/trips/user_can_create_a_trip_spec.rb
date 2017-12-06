require 'spec_helper'

describe "as a visitor, when I visit '/trips/new'" do
  before :each do
    @station_1 = Station.create(name: "SF", dock_count: 5,
    city: "San Francisco", installation_date: "2013-08-23")

    visit '/trips/new'
  end

  it "I expect to see a form to create a new trip" do
    expect(page.status_code).to eq(200)

    fill_in 'trip[duration]', :with => 490
    fill_in 'trip[start_date]', :with => "2013-08-14"
    select "SF", from: "trip[start_station_id]"
    fill_in 'trip[end_date]', :with => "2013-08-14"
    select "SF", from: "trip[end_station_id]"
    fill_in 'trip[bike_id]', :with => 354
    fill_in 'trip[subscription_type]', :with => "Subscriber"
    fill_in 'trip[zip_code]', :with => 34387

    click_on("Submit")

    expect(current_path).to eq("/trips/#{Trip.last.id}")

    expect(page).to have_content(490)
  end
end
