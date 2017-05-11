require './spec/spec_helper'

RSpec.describe "When the user visits the Trips page" do
  before do
    visit('/trips')
  end

  it "they can view an index of all trips" do
    expect(page).to have_content("All Trips")
    expect(page).to have_content("Add New Trip")
    expect(page).to have_selector("a.btn-new")
  end

  context "when trips have been added" do
    before do
      city_1 = City.create(name: "something")
      zipcode1 = Zipcode.create(zipcode: "99999")
      Trip.create(
                    duration: 60,
                    start_date: DateTime.strptime("08/30/2013 11:11", "%m/%d/%Y %H:%M"),
                    start_station_id: 1,
                    end_date: DateTime.strptime("08/30/2013 11:12", "%m/%d/%Y %H:%M"),
                    end_station_id: 1,
                    bike_id: 1,
                    subscription_type: "Subscriber"
      )
      Station.create(
                    name: "something",
                    dock_count: 1,
                    city_id: 1,
                    installation_date: Date.strptime("08/30/2013",'%m/%d/%Y'),
                    longitude: -121.9,
                    latitude: 30.7
      )
      visit('/trips')
    end
    it "the page lists the added trip's duration" do
      expect(page).to have_content(60)
    end
    it "the page lists the added trip's start date and time" do
      expect(page).to have_content("08/30/2013 11:11")
    end
    it "the page lists the added trip's start station name" do
      expect(page).to have_content("something")
    end
    it "the page lists the added trip's end date and time" do
      expect(page).to have_content("08/30/2013 11:12")
    end
    it "the page lists the added trip's end station name" do
      expect(page).to have_content("something")
    end
    it "the page lists the added trip's bike ID" do
      expect(page).to have_content(1)
    end
    it "the page lists the added trip's subscription type" do
      expect(page).to have_content("Subscriber")
    end
    it "the page lists the added trip's view link" do
      expect(page).to have_content("View Trip")
      expect(page).to have_selector(".btn-view")
    end
    it "the page lists the added trip's edit link" do
      expect(page).to have_content("Edit Trip")
      expect(page).to have_selector(".btn-edit")
    end
    it "the page lists the added trip's delete link" do
      expect(page).to have_selector("form .btn-delete")
    end
  end
end
