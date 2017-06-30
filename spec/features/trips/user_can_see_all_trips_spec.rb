require './spec/spec_helper'

RSpec.describe "User can see trip" do
  before(:each) do
    Trip.create(duration: 60, start_date: "2017/06/15", start_station_name: "Denver Station", end_date: "2017/06/15", end_station_name: "Denver Union", bike_id: 123, subscription_type_id: 1, zip_code: 80202)
    SubscriptionType.create(name: "Subscriber")
  end
  it "and has all content" do

  visit '/trips'

  expect(page).to have_content("Duration")
  expect(page).to have_content("Start Date")
  expect(page).to have_content("Start Station Name")
  expect(page).to have_content("End Date")
  expect(page).to have_content("End Station Name")
  expect(page).to have_content("Bike ID")
  expect(page).to have_content("Subscription Type")
  expect(page).to have_content("Zip Code")

  expect(page).to have_content("60")
  expect(page).to have_content("2017/05/15")
  expect(page).to have_content("Denver Station")
  expect(page).to have_content("2017/05/15")
  expect(page).to have_content("Denver Union")
  expect(page).to have_content("123")
  expect(page).to have_content("Subscriber")
  expect(page).to have_content("80202")
  end
end
