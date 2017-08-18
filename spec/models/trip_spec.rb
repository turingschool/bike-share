RSpec.describe Trip do
  describe "class methods" do
    describe ".find_thirty_trips" do
      it "returns thirty trips" do
        35.times do
        Trip.create(:duration => 5, :start_date => '12/3/2015', :end_date => '12/3/2015', :start_station => 1, :end_station => 2, :bike_id => 68, :subscription_type_id => 68)
        end
         expect(Trip.find_thirty_trips(1).length).to eq(30)
      end
    end
  end
end
