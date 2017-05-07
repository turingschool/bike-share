require './spec/spec_helper'

RSpec.describe "When the user visits the Trips page" do
  before do
    visit('/trips')
  end

  it "they can view an index of all trips" do
    expect(page).to have_content("All Trips")
    expect(page).to have_content("Add New Trip")
    expect(page).to have_content("a.btn-new")
  end

  context "when trips have been added" do
    before do
      zipcode1 = Zipcode.create(name: "99999")
      Trip.create!(
                    duration: 1000,
                    start_date: Date.strptime("08/30/2013",'%m/%d/%Y'),
                    start_station_id: 1,
                    end_date: Date.strptime("08/31/2013",'%m/%d/%Y'),
                    end_station_id: 1,
                    bike_id: 1,
                    subscription_type: "Subscriber"
                    zipcode_id: 
      )
      visit('/stations')
    end
  end
end
