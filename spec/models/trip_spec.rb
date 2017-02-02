require_relative '../spec_helper'
RSpec.describe Trip do
  describe "validations" do
    it "is valid with all requested parameters" do
      trip = Trip.create(duration: 600,
                         start_date: "01/01/2017",
                         start_station_id: 17,
                         end_date: "01/01/2017",
                         end_station_id: 78,
                         bike_id: 444,
                         subscription: "customer")
      expect(trip).to be_valid
    end
    it "validades presence of start_date" do
      trip = Trip.create(duration: 600,
                         start_date: "02/01/2017",
                         start_station_id: 56,
                         end_date: "02/01/2017",
                         end_station_id: 17,
                         bike_id: 222,
                         subscription: "subscriber")
      expect(trip).to be_valid
    end
    it "validades presence of end location" do
      trip = Trip.create(duration: 600,
                         start_date: "02/01/2017",
                         start_station_id: 22,
                         end_date: "02/01/2017",
                         bike_id: 222,
                         subscription: "subscriber")
      expect(trip).to_not be_valid
    end
  end
end
