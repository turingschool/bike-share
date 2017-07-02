RSpec.describe Station do
  describe "Class Methods" do
    describe ".total_count" do
      it "returns total count for stations" do
        station_1 = Station.create(name: "A", city: "Boston", dock_count: 1, installation_date: Time.now)
        station_2 = Station.create(name: "B", city: "Denver", dock_count: 1, installation_date: Time.now)
        station_3 = Station.create(name: "C", city: "Denver", dock_count: 3, installation_date: Time.now)

        count = Station.total_count

        expect(count).to eq(3)
      end
    end

    describe ".oldest_station" do
      it "returns the station with the earliest installation date" do
        station_1 = Station.create(name: "A", city: "Boston", dock_count: 1, installation_date: "08/07/2017")
        station_2 = Station.create(name: "B", city: "Denver", dock_count: 2, installation_date: "08/08/2016")
        station_3 = Station.create(name: "C", city: "Denver", dock_count: 3, installation_date: "08/09/2015")

        station = Station.oldest_station

        expect(station).to eq(station_3)
      end
    end

    describe "Validations" do
      it "is invalid without a name" do
        station = Station.new(dock_count: 1, city: "Boston", installation_date: Time.now)

        expect(station).to_not be_valid
      end

      it "is invalid without a dock_count" do
        station = Station.new(name: "California", city: "Boston", installation_date: Time.now)

        expect(station).to_not be_valid
      end

      it "is invalid without a city" do
        station = Station.new(dock_count: 1, name: "Boston", installation_date: Time.now)

        expect(station).to_not be_valid
      end

      it "is invalid without a installation_date" do
        station = Station.new(dock_count: 1, city: "Boston", name: "California")

        expect(station).to_not be_valid
      end

      it "is valid with all attributes" do
       station = Station.new(name: "Gary", city:"Denver", dock_count: 2, installation_date: Time.now)

       expect(station).to be_valid
      end
    end
  end
end
