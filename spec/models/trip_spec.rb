describe Trip do
  describe "validations" do
    it "has to have all data fields present" do
      trip = Trip.new(
        duration: 60,
        start_station: 54,
        end_station: 66,
        bike_id: 66,
        subscription_type_id: 10,
        start_date_id: 6,
        end_date_id: 5,
      )

      invalid_trip = Trip.new(
        duration: 5,
        start_station: 5
      )

      expect(trip).to be_valid
      expect(invalid_trip).to_not be_valid
    end
  end
end
  # describe "class methods" do
  # end
