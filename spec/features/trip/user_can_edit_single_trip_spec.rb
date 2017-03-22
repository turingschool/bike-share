require_relative "../../spec_helper"

RSpec.describe "when a user visits '/trips/:id/edit' " do
  it "they can edit a single trip"do
  #setup
  city = City.create(city: "Denver")
  start_station = city.stations.create(name: "Downtown", dock_count: 15, city: city, installation_date: "2013-08-05")
  end_station = city.stations.create(name: "Caphill", dock_count: 15, city: city, installation_date: "2013-08-05")
  zipcode = Zipcode.create(zip_code: 94062)
  subscription = Subscription.create(subscription: "Customer")
  trip = Trip.create(duration: 32, start_station: start_station, end_station: end_station, bike_id: 1, zipcode: zipcode, subscription: subscription, start_date: "8/29/2013 14:14", end_date: "8/29/2013 14:46")

  #when I visit
  visit "/trips/1/edit"

  #I expect to see trip attributes
  expect(page).to have_content("32")
  expect(page).to have_content("Downtown")
  expect(page).to have_content("Caphill")
  expect(page).to have_content("1")
  expect(page).to have_content("94062")
  expect(page).to have_content("Customer")
  expect(page).to have_content("2013-08-29 14:14")
  expect(page).to have_content("2013-08-29 14:46")

  #and I fill_in new attirbutes
  fill_in "trip[duration]", with: "15"
  fill_in "trip[start_station]", with: "Highlands"
  fill_in "trip[end_station]", with: "RiNo"
  fill_in "trip[bike_id]", with: "2"
  fill_in "trip[subscription]", with: "Subscriber"
  fill_in "trip[zip_code]", with: "80218"
  fill_in "trip[start_date]", with: "2013-09-29 14:14"
  fill_in "trip[duration]", with: "2013-09-29 14:29"

  #and I click on update
  click_on "Update Trip"

  #I expect to be redictected
  expect(current_path).to eq("/trips/1")

  #and I expect to see my updated attributes
  expect(page).to have_content("15")
  expect(page).to have_content("Highlands")
  expect(page).to have_content("LoDo")
  expect(page).to have_content("2")
  expect(page).to have_content("80218")
  expect(page).to have_content("Subscriber")
  expect(page).to have_content("2013-09-29 14:14")
  expect(page).to have_content("2013-09-29 14:29")
  end
end
