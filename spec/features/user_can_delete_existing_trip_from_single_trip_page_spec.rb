require_relative "../spec_helper"

RSpec.describe "as a user deletes an existing trip from a single trip page" do
  it "they can see existing trip data and delete the trip record" do
    city = City.create(city: "Denver")
    zipcode = Zipcode.create(zipcode: 94062)
    trip = Trip.create(duration: 550, start_date: "6/18/14 17:08", start_station_id: 51, end_date: "6/18/14 17:17", end_station_id: 70, bike_id: 551, subscription_type: "Subscriber", zipcode_id: 1)

    visit "/trips/1"
    within(".trip-info") do
      expect(page).to have_content(trip.name)
      expect(page).to have_content(trip.duration)
      expect(page).to have_content(trip.start_date)
      expect(page).to have_content(trip.end_date)
      expect(page).to have_content(trip.bike_id)
      expect(page).to have_content(trip.subscription_type)
      expect(page).to have_content(trip.zipcode_id)
    end
    click_on "Delete Trip"
    expect(current_path).to eq("/trips")
    expect(page).to_not have_content(trip.name)
  end
end
