require_relative "../../spec_helper"

RSpec.describe "as a user deletes an existing trip from all trips page" do
  it "they can see existing trip data and delete the trip record" do
    city = City.create(city: "Denver")
    zipcode = Zipcode.create(zip_code: 94062)
    trip = Trip.create(duration: 550, start_date: "6/18/14 17:08", start_station_id: 51, end_date: "6/18/14 17:17", end_station_id: 70, bike_id: 551, subscription_type: "Subscriber", zipcode_id: 1)

    # as a user
    # when i visit /trips
    visit "/trips"
    # and i see my existing trip data on screen
    # and i click on the 'delete trip' button? link on end of line?
    # then the trip is deleted
    click_on "Delete Trip"
    # and I am redirected to the updated trips list where I will
    expect(current_path).to eq("/trips")
    # not see the deleted trip data any longer
    expect(page).to_not have_content(trip.name)
  end
end


# test a bigger data set
# 2 cities, 2 trips - figure out how to determine button interaction/solf the ambiguous-type issue
#
