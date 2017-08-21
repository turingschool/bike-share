RSpec.describe "User can edit a trip" do
  it "when visiting 'trips/:id/edit'" do
    trip = Trip.create(duration: 49, start_date: "2017-08-20 19:20:22",  start_station_name: "Banana Town", start_station_id: 84, end_date: "2017-08-20 19:20:22", end_station_name: "Pants Town", end_station_id: 94, bike_id: 4, subscription_type: "Customer", zip_code: 99000)

    visit "/trips"

    expect(page).to have_content("Banana Town")
    expect(page).to have_content("Customer")

    click_on("Delete")

    expect(page).to_not have_content("Banana Town")
    expect(page).to_not have_content("Customer")

  end
end
