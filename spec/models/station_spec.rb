RSpec.describe Station do
  describe "Validations" do
      it "is invalid without a name" do
        station = Station.new(dock_count: 1, city: "Boston", installation_date_id: 1)

        expect(station).to_not be_valid
      end

      it "is invalid without a dock_count" do
        station = Station.new(name: "California", city: "Boston", installation_date_id: 1)

        expect(station).to_not be_valid
      end

      it "is invalid without a city" do
        station = Station.new(dock_count: 1, name: "Boston", installation_date_id: 1)

        expect(station).to_not be_valid
      end

      it "is invalid without a installation_date_id" do
        station = Station.new(dock_count: 1, city: "Boston", name: "California")

        expect(station).to_not be_valid
      end

      it "is valid with all attributes" do
       station = Station.new(name: "Gary", city:"Denver", dock_count: 2, installation_date_id: 1)

       expect(station).to be_valid
      end
    end

  describe "Class Methods" do
    describe ".stations_with_fewest_bikes_available" do
      it "returns the station with the fewest bikes available based on docks" do
        Station.create(name: "Mod2BEE", dock_count: 1, installation_date_id: "11/4/13", city: "Chicago")
        Station.create(name: "Mod1BEE", dock_count: 5, installation_date_id: "12/7/14", city: "Chicago")
        Station.create(name: "Mod3BEE", dock_count: 3, installation_date_id: "1/23/12", city: "Chicago")

        result = Station.stations_with_fewest_bikes_available

        expect(result[0].name).to eq("Mod2BEE")
      end

      it "returns the stations with the fewest bikes available based on docks" do
        Station.create(name: "Mod2BEE", dock_count: 1, installation_date_id: "11/4/13", city: "Chicago")
        Station.create(name: "Mod1BEE", dock_count: 1, installation_date_id: "12/7/14", city: "Chicago")
        Station.create(name: "Mod3BEE", dock_count: 5, installation_date_id: "1/23/12", city: "Chicago")

        result = Station.stations_with_fewest_bikes_available

        expect(result.count).to eq(2)
        expect(result[0].class).to eq(Station)
      end
    end

    describe ".least_number_of_available_bikes" do
      it "returns the least bikes available at a station" do
        station_1 = Station.create(name: "First", dock_count: 4, city: "Detroit", installation_date_id: 1)
        station_2 = Station.create(name: "Second", dock_count: 2, city: "Detroit", installation_date_id: 1)
        station_3 = Station.create(name: "Third", dock_count: 23, city: "Detroit", installation_date_id: 1)
        station_4 = Station.create(name: "Fourth", dock_count: 6, city: "Detroit", installation_date_id: 1)
        station_5 = Station.create(name: "Fifth", dock_count: 5, city: "Detroit", installation_date_id: 1)

        result = Station.least_number_of_available_bikes

        expect(station_1.class).to eq(Station)
        expect(result).to eq(2)
      end
    end

    describe ".average_bikes_available_per_station" do
      it "finds average number of bikes rounded to whole number" do
        station = Station.create(name: "Gary", city:"Denver", dock_count: 2, installation_date_id: 1)
        station2 = Station.create(name: "Lex", city:"Chicago", dock_count: 6, installation_date_id: 1)
        station3 = Station.create(name: "Jim", city:"San Diego", dock_count: 8, installation_date_id: 1)
        station4 = Station.create(name: "Glop", city:"Seattle", dock_count: 2, installation_date_id: 1)

        average_bikes = Station.average_bikes_available_per_station

        expect(average_bikes.class).to eq(Fixnum)
        expect(average_bikes).to eq(5)
      end
    end

    describe ".most_recently_installed" do
      it "returns most recently made station" do
        date = BikeShareDate.create(date: Date.strptime('1/1/2012', '%m/%d/%Y'))
        date_2 = BikeShareDate.create(date: Date.strptime('2/5/2017', '%m/%d/%Y'))
        date_3 = BikeShareDate.create(date: Date.strptime('4/5/2015', '%m/%d/%Y'))
        station1 = Station.create(name: "Gary", city:"Denver", dock_count: 2, installation_date_id: 1)
        station2 = Station.create(name: "Lex", city:"Chicago", dock_count: 6, installation_date_id: 2)
        station3 = Station.create(name: "Jim", city:"San Diego", dock_count: 8, installation_date_id: 3)
        station = Station.most_recently_installed

        expect(station.class).to eq(Station)
        expect(station).to eq(station2)
     end
   end

     describe '.most_number_of_available_bikes' do
       it "returns the most bikes available at a station" do
         station_1 = Station.create(name: "First", dock_count: 4, city: "Detroit", installation_date_id: 1)
         station_2 = Station.create(name: "Second", dock_count: 2, city: "Detroit", installation_date_id: 1)
         station_3 = Station.create(name: "Third", dock_count: 23, city: "Detroit", installation_date_id: 1)
         station_4 = Station.create(name: "Fourth", dock_count: 6, city: "Detroit", installation_date_id: 1)
         station_5 = Station.create(name: "Fifth", dock_count: 5, city: "Detroit", installation_date_id: 1)

         result = Station.most_number_of_available_bikes

         expect(station_1.class).to eq(Station)
         expect(result).to eq(23)
       end
     end

     describe ".total_count" do
       it "returns total count for stations" do
         station_1 = Station.create(name: "A", city: "Boston", dock_count: 1, installation_date_id: 1)
         station_2 = Station.create(name: "B", city: "Denver", dock_count: 1, installation_date_id: 1)
         station_3 = Station.create(name: "C", city: "Denver", dock_count: 3, installation_date_id: 1)

         count = Station.total_count

         expect(count).to eq(3)
       end
     end

     describe ".oldest_station" do
       it "returns the station with the earliest installation date" do
        date = BikeShareDate.create(date: Date.strptime('1/1/2012', '%m/%d/%Y'))
        date_2 = BikeShareDate.create(date: Date.strptime('2/5/2017', '%m/%d/%Y'))
        date_3 = BikeShareDate.create(date: Date.strptime('2/2/2015', '%m/%d/%Y'))
        station_1 = Station.create(name: "A", city: "Boston", dock_count: 1, installation_date_id: 2)
        station_2 = Station.create(name: "B", city: "Denver", dock_count: 2, installation_date_id: 3)
        station_3 = Station.create(name: "C", city: "Denver", dock_count: 3, installation_date_id: 1)

         station = Station.oldest_station

         expect(station).to eq(station_3)
       end
     end

     describe ".station_with_most_bikes" do
       it "returns the station with the greatest bike count" do
         station_1 = Station.create(name: "A", city: "Boston", dock_count: 2, installation_date_id: 1)
         station_2 = Station.create(name: "B", city: "Denver", dock_count: 1, installation_date_id: 1)
         station_3 = Station.create(name: "C", city: "Denver", dock_count: 3, installation_date_id: 1)
         station_4 = Station.create(name: "D", city: "Denver", dock_count: 3, installation_date_id: 1)

         matching_station = Station.station_with_most_bikes

         expect(matching_station.sample.dock_count).to eq(station_3.dock_count)
       end
     end

     describe ".most_trip_date" do
       it "returns the date with the highest number of trips started at this station" do
         trip_1 = Trip.create(duration: 75, start_date_id: 2, start_station_id: 3, end_date_id: 2, end_station_id: 5, bike_id: 6, subscription_type: "customer", zipcode_id: 7)
         trip_2 = Trip.create(duration: 75, start_date_id: 2, start_station_id: 3, end_date_id: 2, end_station_id: 5, bike_id: 6, subscription_type: "customer", zipcode_id: 7)
         trip_3 = Trip.create(duration: 75, start_date_id: 3, start_station_id: 3, end_date_id: 3, end_station_id: 5, bike_id: 6, subscription_type: "customer", zipcode_id: 7)
         trip_3 = Trip.create(duration: 75, start_date_id: 1, start_station_id: 2, end_date_id: 3, end_station_id: 5, bike_id: 6, subscription_type: "customer", zipcode_id: 7)
         date_1 = BikeShareDate.create(date: Date.strptime('1/1/2012', '%m/%d/%Y'))
         date_2 = BikeShareDate.create(date: Date.strptime('2/5/2017', '%m/%d/%Y'))
         date_3 = BikeShareDate.create(date: Date.strptime('4/5/2015', '%m/%d/%Y'))
         station_1 = Station.create(name: "A", city: "Boston", dock_count: 2, installation_date_id: 1)
         station_2 = Station.create(name: "B", city: "Atlanta", dock_count: 1, installation_date_id: 1)
         station_3 = Station.create(name: "C", city: "Denver", dock_count: 3, installation_date_id: 1)

         result = station_3.most_trip_date

         expect(result).to eq("February 05, 2017")
       end
     end

     describe '.id_by_name' do
       it "returns the id of a station that matches the name" do
         station_1 = Station.create(name: "A", city: "Boston", dock_count: 2, installation_date_id: 1)
         station_2 = Station.create(name: "B", city: "Denver", dock_count: 1, installation_date_id: 1)
         station_3 = Station.create(name: "C", city: "Denver", dock_count: 3, installation_date_id: 1)
         station_4 = Station.create(name: "D", city: "Denver", dock_count: 3, installation_date_id: 1)

         matching_station_id = Station.id_by_name("B")

         expect(matching_station_id).to eq(2)
       end
     end
  end
end
