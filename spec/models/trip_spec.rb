RSpec.describe Trip do
  describe "Validations" do
    it "is invalid without a duration" do
      trip = Trip.new(duration: 12, start_date_id: 12, start_station_id: 12, end_date_id: 12, end_station_id: 12, bike_id: 12, subscription_type: "Subscriber")

      expect(trip).to_not be_valid
    end
  end
end
