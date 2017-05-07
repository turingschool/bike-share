require './spec/spec_helper'

RSpec.describe "When a user edits a trip" do
  before do
    zipcode1 = Zipcode.create(name: "99999")
    Trip.create!(
                  duration: 60,
                  start_date: Date.strftime("08/30/2013 11:11", "%m/%d/%Y %H:%M"),
                  start_station_id: 1,
                  end_date: Date.strftime("08/30/2013 11:12", "%m/%d/%Y %H:%M"),
                  end_station_id: 1,
                  bike_id: 1,
                  subscription_type: "Subscriber"
    )
    Station.create!(
                  name: "something",
                  dock_count: 1,
                  city_id: 1,
                  installation_date: Date.strptime("08/30/2013",'%m/%d/%Y'),
                  longitude: -121.9,
                  latitude: 30.7
    )
  end

  it "can edit the duration" do
    visit('/trips/1/edit')
    expect(page)

  end

end
