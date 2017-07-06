RSpec.describe Date do
  describe "Validation" do

    it "is invalid without a date" do
      date = BikeDate.create(date: nil)

      expect(date).to_not be_valid
    end
  end


#   describe "Class methods" do
#     before :each do
#       @date = BikeDate.create()
#       @trip = Trip.create
#       @trip = Trip.create
#       @trip = Trip.create
#     end
#
#     it "shows date with highest number of trips" do
#       highest_trip_date = BikeDate.date_with_highest_trips
#
#       expect(highest_trip_date).to eq("?????")
#     end
#
#   end
end



# Single date with the highest number of trips with a count of those trips.
# Single date with the lowest number of trips with a count of those trips.
