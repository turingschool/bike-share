RSpec.describe Station do
  describe "Class Methods" do
    describe ".total_stations"
      it 'returns total station count' do
        Station.create(name: "San Jose Civic Center", dock_count: 27, city: "San Jose", installation_date: "8/15/13")
        Station.create(name: "Sam", dock_count: 10, city: "San Jose", installation_date: "8/12/14")

        expect(Station.total_stations).to eq(2)
      end

    describe ".avg_bikes_avail" do
      it 'returns avg bikes available' do
        Station.create(name: "San Jose Civic Center", dock_count: 30, city: "San Jose", installation_date: "8/15/13")
        Station.create(name: "Sam", dock_count: 10, city: "San Jose", installation_date: "8/12/14")

        expect(Station.avg_bikes_avail).to eq(20)
      end
    end

    describe '.most_bikes_avail' do
      it 'returns most bikes available' do
        Station.create(name: "San Jose Civic Center", dock_count: 30, city: "San Jose", installation_date: "8/15/13")
        Station.create(name: "Sam", dock_count: 10, city: "San Jose", installation_date: "8/12/14")

        expect(Station.most_bikes_avail).to eq(30)
      end
    end

    describe '.station_with_most_bikes' do
      it 'returns station name with most bikes' do
        Station.create(name: "San Jose Civic Center", dock_count: 30, city: "San Jose", installation_date: "8/15/13")
        Station.create(name: "Sam", dock_count: 10, city: "San Jose", installation_date: "8/12/14")

        expect(Station.station_with_most_bikes).to eq("San Jose Civic Center")
      end
    end

    describe '.fewest_bikes_avail' do
      it 'returns fewest bikes available' do
        Station.create(name: "San Jose Civic Center", dock_count: 30, city: "San Jose", installation_date: "8/15/13")
        Station.create(name: "Sam", dock_count: 10, city: "San Jose", installation_date: "8/12/14")

        expect(Station.fewest_bikes_avail).to eq(10)
      end
    end

    describe '.station_with_fewest_bikes' do
      it 'returns station name with fewest bikes' do
        Station.create(name: "San Jose Civic Center", dock_count: 30, city: "San Jose", installation_date: "8/15/13")
        Station.create(name: "Sam", dock_count: 10, city: "San Jose", installation_date: "8/12/14")

        expect(Station.station_with_fewest_bikes).to eq("Sam")
      end
    end

    describe '.most_recent_install_station' do
      it 'returns most recently installed station' do
        Station.create(name: "San Jose Civic Center", dock_count: 30, city: "San Jose", installation_date: "2013-08-06")
        Station.create(name: "Sam", dock_count: 10, city: "San Jose", installation_date: "2014-04-09")

        expect(Station.most_recent_install_station).to eq("Sam")
      end
    end

    describe '.oldest_install_station' do
      it 'returns oldest installed station' do
        Station.create(name: "San Jose Civic Center", dock_count: 30, city: "San Jose", installation_date: "2013-08-06")
        Station.create(name: "Sam", dock_count: 10, city: "San Jose", installation_date: "2014-04-09")

        expect(Station.oldest_install_station).to eq("San Jose Civic Center")
      end
    end

    describe "Validations" do
      context "Station" do
      it 'is invalid without a name' do
        station1 = Station.create(dock_count: 27, city: "San Jose", installation_date: "8/15/13")

        expect(station1).to_not be_valid
      end

      it 'is invalid without a dock count' do
        station1 = Station.create(name: "San Jose Civic Center", city: "San Jose", installation_date: "8/15/13")

        expect(station1).to_not be_valid
      end

      it 'is invalid without a city' do
        station1 = Station.create(name: "San Jose Civic Center", dock_count: 27, installation_date: "8/15/13")

        expect(station1).to_not be_valid
      end

      it 'is invalid without a installation date' do
        station1 = Station.create(name: "San Jose Civic Center", dock_count: 27, city: "San Jose")

        expect(station1).to_not be_valid
      end

    end
    end
  end
end
