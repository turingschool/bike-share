RSpec.describe Trip do
  describe "Instance Methods" do
    describe "#start_station_name" do
      it "returns start station name" do
        trip = Trip.new(duration: 10, start_date_id: 20141010, start_station_name: "Japantown", end_date: 20151010, end_station_name: "Japantown", bike_id: 520, subscription_type: "Subscriber", zip_code: 94127)
        result = trip.start_station_name
        expect(result).to eq("Japantown")
      end
    end
  end
end
