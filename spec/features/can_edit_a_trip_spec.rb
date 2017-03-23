require_relative "../spec_helper"

RSpec.describe "Editing a trip from all trips index" do

  before :each do
    City.create(name: "Denver")
    SubscriptionType.create(flavor: "Subscriber")
    Station.create(name: "Downtown", installation_date: "20140331", city_id: "1", dock_count: 4)
    Station.create(name: "Anything", installation_date: "20140331", city_id: "1", dock_count: 4)
    Trip.create(duration: 103,
                start_date: "2013-08-09",
                start_station_id: 2,
                end_date: "2013-08-09",
                bike_id: 527,
                end_station_id: 1,
                subscription_type_id: 1
                )
  end

  it "Can click button and be taken to corresponding page" do
    visit "/trips"

    click_on "Edit Trip"

    expect(current_path).to eq("/trips/1/edit")
  end

  it "Can edit a trip's attributes" do
    visit "/trips/1/edit"



    fill_in "trip[start_date]", with: "2013-08-09"
    fill_in "start_station[name]", with: "Anything"
    fill_in "trip[duration]", with: 45
    fill_in "trip[end_date]", with: "2013-08-09"
    fill_in "end_station[name]", with: "Downtown"
    fill_in "trip[bike_id]", with: 345
    fill_in "subscription_type[flavor]", with: "Subscriber"
    fill_in "trip[zip_code]", with: 53211

    click_on "Submit"

    expect(current_path).to eq("/trips/1")

    expect(page).to have_content("Anything")
  end
end
