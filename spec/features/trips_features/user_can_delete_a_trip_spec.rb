require './spec/spec_helper'

RSpec.describe "When a user clicks delete" do

  it "deletes on the index" do
    zipcode = Zipcode.create(zipcode: 94127)
    trip = Trip.create(
                      start_date: DATE.strptime("08/30/2013 11:11", '%m/%d/%Y %H:%M'),
                      start_station_id: 1,
                      end_date: DATE.strptime("08/30/2013 11:15", '%m/%d/%Y %H:%M'),
                      end_station_id: 1,
                      bike_id: 5,
                      subscription_type: "Subscriber",
                      zipcode_id: 1
    )

    visit('/trips')
    expect(page).to have_button("Delete")
  end
end
