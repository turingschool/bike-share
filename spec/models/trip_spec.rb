RSpec.describe Trip do
  describe "class methods" do
    describe ".find_thirty_trips" do
      it "returns thirty trips" do
        35.times do
        Trip.create(:duration => 5,
                    :start_date => '12/3/2015',
                    :end_date => '12/3/2015',
                    :start_station => 1,
                    :end_station => 2,
                    :bike_id => 68,
                    :subscription_type_id => 68)
        end
         expect(Trip.find_thirty_trips(1).length).to eq(30)
      end
    end
    describe ".sort_trips_by_date" do
      it "sorts trips by date" do
        20.times do
          Trip.create(:duration => 5,
                      :start_date => '12/3/2015',
                      :end_date => '12/3/2015',
                      :start_station => 1,
                      :end_station => 2,
                      :bike_id => 68,
                      :subscription_type_id => 68)

          Trip.create(:duration => 5,
                      :start_date => '12/5/2015',
                      :end_date => '12/5/2015',
                      :start_station => 1,
                      :end_station => 2,
                      :bike_id => 68,
                      :subscription_type_id => 68)
        end

        expect(Trip.find_thirty_trips(1).second.start_date.strftime).to eq('2015-03-12')
        expect(Trip.find_thirty_trips(1).third.start_date.to_s).to eq('2015-03-12')
        expect(Trip.find_thirty_trips(1).fourth.start_date.to_s).to eq('2015-03-12')
        expect(Trip.find_thirty_trips(1).fifth.start_date.to_s).to eq('2015-03-12')
      end
    end
  end
end
