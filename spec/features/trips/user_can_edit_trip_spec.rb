require './spec/spec_helper'

RSpec.describe "user can edit a trip" do
  before(:each) do
    Trip.create(duration: 60, start_date: "2017/06/15", start_station_name: "Platte Park", end_date: "2018/07/16", end_station_name: "Washington Park", bike_id: 123, subscription_type_id: 1, zip_code: 80210)
    SubscriptionType.create(name: "Subscriber")
  end

  it "edit page has has duration, start date, start station name, start station id, end date, end station name, end station id, bike id, subsription type id, zip code" do
    # visit '/trip/?/edit' Don't know how to setup specific page in url

    fill_in "trip[duration]", with: 70
    fill_in "trip[start_date]", with: "2018/07/16"
    fill_in "trip[start_station_name]", with: "Platte Park"
    fill_in "trip[end_date]", with: "2018/07/16"
    fill_in "trip[end_station_name]", with: "Washington Park"
    fill_in "trip[bike_id]", with: 123
    fill_in "subscription_type[name]", with: "Subscriber"
    fill_in "trip[zip_code]", with: 80210

    click_on "Update Trip"

    expect(current_path).to eq("/trips/page/1")
    expect(page).to have_content("70")
    expect(page).to have_content("2018-07-16")
    expect(page).to have_content("Platte Park")
    expect(page).to have_content("2018-07-16")
    expect(page).to have_content("Washington Park")
    expect(page).to have_content("123")
    expect(page).to have_content("Subscriber")
    expect(page).to have_content("80210")
  end
end
