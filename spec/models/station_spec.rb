require './spec/spec_helper'


RSpec.describe Station do
  describe "station can return all attributes" do
    it "has all attributes" do
      station = Station.create(name: "something", dock_count: 1, city_id: 1, installation_date: Date.strptime("08/30/2013",'%m/%d/%Y'), longitude: -121.9, latitude: 30.7)

      expect(station.id).to eq 1
      expect(station.name).to eq "something"
      expect(station.dock_count).to eq 1
      expect(station.city_id).to eq 1
      expect(station.installation_date).to eq Date.strptime("08/30/2013",'%m/%d/%Y')
      expect(station.longitude).to eq -121.9
      expect(station.latitude).to eq 30.7
    end
  end

  describe "station requires all necessary fields" do
    it "is invalid without a name" do
      station = Station.create(dock_count: 1, city_id: 1, installation_date: Date.strptime("08/30/2013",'%m/%d/%Y'), longitude: -121.9, latitude: 30.7)

      expect(station).to be_invalid
    end

    it "is invalid without a dock_count" do
      station = Station.create(name: "something", city_id: 1, installation_date: Date.strptime("08/30/2013",'%m/%d/%Y'), longitude: -121.9, latitude: 30.7)

      expect(station).to be_invalid
    end

    it "is invalid without a city_id" do
      station = Station.create(name: "something", dock_count: 1, installation_date: Date.strptime("08/30/2013",'%m/%d/%Y'), longitude: -121.9, latitude: 30.7)

      expect(station).to be_invalid
    end

    it "is invalid without a installation_date" do
      station = Station.create(name: "something", city_id: 1, dock_count: 1, longitude: -121.9, latitude: 30.7)

      expect(station).to be_invalid
    end

    it "is invalid without a longitude" do
      station = Station.create(name: "something", city_id: 1, dock_count: 1, installation_date: Date.strptime("08/30/2013",'%m/%d/%Y'), latitude: 30.7)

      expect(station).to be_invalid
    end

    it "is invalid without a latitude" do
      station = Station.create(name: "something", city_id: 1, dock_count: 1, installation_date: Date.strptime("08/30/2013",'%m/%d/%Y'), longitude: -121.9)

      expect(station).to be_invalid
    end
  end

  describe "station can calculate dashboard information" do
    before {
      Station.create(name: "something", dock_count: 1, city_id: 1, installation_date: Date.strptime("08/30/2015",'%m/%d/%Y'), longitude: -121.9, latitude: 30.7)
      Station.create(name: "else", dock_count: 2, city_id: 1, installation_date: Date.strptime("08/30/2013",'%m/%d/%Y'), longitude: -121.9, latitude: 30.7)
      Station.create(name: "other", dock_count: 3, city_id: 1, installation_date: Date.strptime("08/30/2014",'%m/%d/%Y'), longitude: -121.9, latitude: 30.7)
      Station.create(name: "and again", dock_count: 4, city_id: 1, installation_date: Date.strptime("08/30/2014",'%m/%d/%Y'), longitude: -121.9, latitude: 30.7)
    }
    it "can calculate the average number of bikes for all stations" do
      expect(Station.average_bikes).to eq(2.5)
    end

    it "can calculate the most bikes at any stations" do
      expect(Station.most_bikes_count).to eq(4)
    end

    it "can calculate which stations have the most bikes" do
      expect(Station.most_bikes_avail_at).to eq('and again')
    end

    it "can calculate the fewest bikes at any stations" do
      expect(Station.fewest_bikes_count).to eq(1)
    end

    it "can calculate which stations have the fewest bikes" do
      expect(Station.fewest_bikes_avail_at).to eq('something')
    end

    it "can find the oldest station created" do
      expect(Station.oldest_station).to eq('else')
    end

    it "can find the newewst station created" do
      expect(Station.newest_station).to eq('something')
    end
  end

end
