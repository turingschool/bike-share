require_relative "../../spec_helper"

RSpec.describe "as a user deletes an existing trip from a single trip page" do
  xit "they can see existing trip data and delete the trip record" do
    city = City.create(city: "Denver")
    start_station = Station.create(name: "Denver", dock_count: 15, city_id: 1, installation_date: "12/05/1987")
    end_station = Station.create(name: "Boulder", dock_count: 14, city_id: 2, installation_date: "12/05/1987")
    zipcode = Zipcode.create(zip_code: 94062)
    subscription = Subscription.create(subscription: "Customer")
    trip = Trip.create(duration: 123, start_date: "12/05/1987",
                                     start_station: start_station, end_date: "12/05/1987",
                                     end_station: end_station, bike_id: 1,
                                     subscription_id: 1, zipcode_id: 1)

    visit "/trips/1"

    expect(page).to have_content(trip.duration)
    expect(page).to have_content(trip.start_date)
    expect(page).to have_content(trip.end_date)
    expect(page).to have_content(trip.bike_id)
    expect(page).to have_content(trip.subscription.subscription)
    expect(page).to have_content(trip.zipcode_id)

    click_on("Delete Trip")
    expect(current_path).to eq("/trips")
    expect(page).to_not have_content(trip.id)
  end
end
