RSpec.describe Station do
  describe "Class Methods" do
    describe ".least_number_of_available_bikes" do
      it "returns the least bikes available at a station" do
        station_1 = Station.create(name: "First", dock_count: 4, city: "Detroit", installation_date: Time.now)
        station_2 = Station.create(name: "Second", dock_count: 2, city: "Detroit", installation_date: Time.now)
        station_3 = Station.create(name: "Third", dock_count: 23, city: "Detroit", installation_date: Time.now)
        station_4 = Station.create(name: "Fourth", dock_count: 6, city: "Detroit", installation_date: Time.now)
        station_5 = Station.create(name: "Fifth", dock_count: 5, city: "Detroit", installation_date: Time.now)

        result = Station.least_number_of_available_bikes

        expect(station_1.class).to eq(Station)
        expect(result).to eq(2)
      end
    end
  end

  describe "Validations" do
    it "is invalid without a name" do
      station = Station.new(dock_count: 1, city: "Boston", installation_date: Time.now)

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

    describe ".station_with_most_bikes" do
      it "returns the station with the greatest bike count" do
        station_1 = Station.create(name: "A", city: "Boston", dock_count: 2, installation_date: Time.now)
        station_2 = Station.create(name: "B", city: "Denver", dock_count: 1, installation_date: Time.now)
        station_3 = Station.create(name: "C", city: "Denver", dock_count: 3, installation_date: Time.now)
        station_4 = Station.create(name: "D", city: "Denver", dock_count: 3, installation_date: Time.now)

        matching_station = Station.station_with_most_bikes

        expect(matching_station.sample.dock_count).to eq(station_3.dock_count)
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

  describe "Class Methods" do
    describe ".stations_with_fewest_bikes_available" do
      it "returns the station with the fewest bikes available based on docks" do
        Station.create(name: "Mod2BEE", dock_count: 1, installation_date: "11/4/13", city: "Chicago")
        Station.create(name: "Mod1BEE", dock_count: 5, installation_date: "12/7/14", city: "Chicago")
        Station.create(name: "Mod3BEE", dock_count: 3, installation_date: "1/23/12", city: "Chicago")

        result = Station.stations_with_fewest_bikes_available

        expect(result[0].name).to eq("Mod2BEE")
      end
      it "returns the stations with the fewest bikes available based on docks" do
        Station.create(name: "Mod2BEE", dock_count: 1, installation_date: "11/4/13", city: "Chicago")
        Station.create(name: "Mod1BEE", dock_count: 1, installation_date: "12/7/14", city: "Chicago")
        Station.create(name: "Mod3BEE", dock_count: 5, installation_date: "1/23/12", city: "Chicago")

        result = Station.stations_with_fewest_bikes_available

        expect(result.count).to eq(2)
        expect(result[0].class).to eq(Station)
      end
    end

    describe ".average_bikes_available_per_station" do
      it "finds average number of bikes rounded to whole number" do
        station = Station.create(name: "Gary", city:"Denver", dock_count: 2, installation_date: Time.now)
        station2 = Station.create(name: "Lex", city:"Chicago", dock_count: 6, installation_date: Time.now)
        station3 = Station.create(name: "Jim", city:"San Diego", dock_count: 8, installation_date: Time.now)
        station4 = Station.create(name: "Glop", city:"Seattle", dock_count: 2, installation_date: Time.now)

        average_bikes = Station.average_bikes_available_per_station

        expect(average_bikes.class).to eq(Fixnum)
        expect(average_bikes).to eq(5)
      end
      it "returns most recently made station" do
        station1 = Station.create(name: "Gary", city:"Denver", dock_count: 2, installation_date: "8/12/2013")
        station2 = Station.create(name: "Lex", city:"Chicago", dock_count: 6, installation_date: "8/6/2017")
        station3 = Station.create(name: "Jim", city:"San Diego", dock_count: 8, installation_date: "9/6/2013")

        station = Station.most_recently_installed

        expect(station.class).to eq(Station)
        expect(station).to eq(station2)
     end
   end
  end
end
