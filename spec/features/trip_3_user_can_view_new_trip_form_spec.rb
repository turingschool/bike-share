require_relative '../spec_helper'

RSpec.describe "user can see form for creating a new trip" do
  it "will display the correct empty form" do
    customer = Customer.create(name: "Customer")
    customer.trips.create!(duration: 200,
                           start_date: "2000-8-12",
                           start_station_id: 1,
                           end_date: "2000-8-12",
                           end_station_id: 2,
                           bike_id: 13,
                           zip_code: 80220)

    visit('/trips')
    click_on "Create New Trip"

    expect(page).to have_content("Create A New Trip")
  end
end
