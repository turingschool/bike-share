RSpec.context Trip do
  describe 'Class Methods' do
  end

  describe "Validates" do
    it 'creates a trip given necessary parameters' do
     cool = Trip.create(duration: 211,
                        start_date: "11-3-2014 10:10",
                        start_station_id: 2,
                        end_station_id: 4,
                        end_date: "11-3-2014 14:55",
                        bike_id: 2,
                        subscription_type: "Customer",
                        zip_code: 33156)

      expect(cool).to be_valid
    end

    it 'existence of duration' do
     cool = Trip.create(start_date: "11-3-2014 10:10",
                        start_station_id: 2,
                        end_station_id: 4,
                        end_date: "11-3-2014 14:55",
                        bike_id: 2,
                        subscription_type: "Customer",
                        zip_code: 33156)

      expect(cool).to_not be_valid
    end

    it "presence of start date" do
      cool = Trip.create(duration: 211,
                         start_station_id: 2,
                         end_station_id: 4,
                         end_date: "11-3-2014 14:55",
                         bike_id: 2,
                         subscription_type: "Customer",
                         zip_code: 33156)

      expect(cool).to_not be_valid
    end

    it "presence of start station id" do
      cool = Trip.create(duration: 211,
                         start_date: "11-3-2014 10:10",
                         end_station_id: 4,
                         end_date: "11-3-2014 14:55",
                         bike_id: 2,
                         subscription_type: "Customer",
                         zip_code: 33156)

      expect(cool).to_not be_valid
    end

    it 'existence of end station id' do
     cool = Trip.create(duration: 211,
                        start_date: "11-3-2014 10:10",
                        start_station_id: 2,
                        end_date: "11-3-2014 14:55",
                        bike_id: 2,
                        subscription_type: "Customer",
                        zip_code: 33156)

      expect(cool).to_not be_valid
    end

    it 'existence of end date' do
     cool = Trip.create(duration: 211,
                        start_date: "11-3-2014 10:10",
                        start_station_id: 2,
                        end_station_id: 4,
                        bike_id: 2,
                        subscription_type: "Customer",
                        zip_code: 33156)

      expect(cool).to_not be_valid
    end

    it 'existence of bike id' do
     cool = Trip.create(duration: 211,
                        start_date: "11-3-2014 10:10",
                        start_station_id: 2,
                        end_station_id: 4,
                        end_date: "11-3-2014 14:55",
                        subscription_type: "Customer",
                        zip_code: 33156)

      expect(cool).to_not be_valid
    end

    it 'existence of subscription type' do
     cool = Trip.create(duration: 211,
                        start_date: "11-3-2014 10:10",
                        start_station_id: 2,
                        end_station_id: 4,
                        end_date: "11-3-2014 14:55",
                        bike_id: 2,
                        zip_code: 33156)

      expect(cool).to_not be_valid
    end

    it 'existence of zip code' do
     cool = Trip.create(duration: 211,
                        start_date: "11-3-2014 10:10",
                        start_station_id: 2,
                        end_station_id: 4,
                        end_date: "11-3-2014 14:55",
                        bike_id: 2,
                        subscription_type: "Customer")

      expect(cool).to_not be_valid
    end
  end
end