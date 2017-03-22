require_relative "../../spec_helper"

RSpec.describe "as a user deletes an existing trip from all trips page" do
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

    # as a user
    # when i visit /trips
    visit "/trips"
    # and i see my existing trip data on screen
    # and i click on the 'delete trip' button? link on end of line?
    # then the trip is deleted
    click_on("Delete Trip")
    # and I am redirected to the updated trips list where I will
    expect(current_path).to eq("/trips")
    # not see the deleted trip data any longer
    expect(page).to_not have_content(trip.duration)
  end
end


# test a bigger data set
# 2 cities, 2 trips - figure out how to determine button interaction/solf the ambiguous-type issue
#
