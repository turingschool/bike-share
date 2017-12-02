require 'spec_helper'

describe "as a user" do
  describe "when I visit '/trips' it displays individual trip data" do
    before :each do
      @trip_1 = Trip.create(duration: 63, start_date: "2013-08-29", start_station_id: 4,
      start_station_name: "Embarcadero", end_date: "2013-08-29", end_station_id: 5,
      end_station_name: "Market St", bike_id: 520, subscription_type: "Subscriber",
      zip_code: 94127)
      @trip_2 = Trip.create(duration: 53, start_date: "2013-08-27", start_station_id: 2,
      start_station_name: "SFO", end_date: "2013-08-28", end_station_id: 6,
      end_station_name: "Mission District", bike_id: 510, subscription_type: "Customer",
      zip_code: 94105)

      visit '/trips'
    end

    it "I expect to see trip duration" do
      expect(page.status_code).to eq(200)

      expect(page).to have_content(63)
      expect(page).to have_content(53)
    end

    it "I expect to see trip start date" do
      expect(page).to have_content("2013-08-27")
      expect(page).to have_content("2013-08-29")
    end

    it "I expect to see trip end date" do
      expect(page).to have_content("2013-08-29")
      expect(page).to have_content("2013-08-28")
    end

    it "I expect to see trip start station name" do
      expect(page).to have_content("Embarcadero")
      expect(page).to have_content("SFO")
    end

    it "I expect to see trip end station name" do
      expect(page).to have_content("Market St")
      expect(page).to have_content("Mission District")
    end

    it "I expect to see trip bike id" do
      expect(page).to have_content(520)
      expect(page).to have_content(510)
    end

    it "I expect to see subscription type" do
      expect(page).to have_content("Subscriber")
      expect(page).to have_content("Customer")
    end

    it "I expect to see trip zip code" do
      expect(page).to have_content(94105)
      expect(page).to have_content(94127)
    end

    it "I expect to be able to edit a trip" do
      first(".edit").click
      expect(current_path).to eq('/trips/1/edit')
    end

    it "I expect to ba able to delete a trip" do
      first(".delete").click

      expect(current_path).to eq('/trips')
    end
  end
end
