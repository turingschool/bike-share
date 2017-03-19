require_relative "../spec_helper"

RSpec.describe Station do

  describe "validations" do

    it "is valid with all attributes" do

      station = Station.create({name: "PooTown",
                    dock_count: 15,
                    city_id: 1,
                    installation_date: "8/12/13"})
      expect(station).to be_valid
    end

    it "is invalid without name" do

      station = Station.create({dock_count: 15,
                            city_id: 1,
                            installation_date: "8/12/13"})
      expect(station).to_not be_valid
    end

    it "is invalid without dock_count" do

      station = Station.create({name: "PooTown",
                            city_id: 1,
                            installation_date: "8/12/13"})
      expect(station).to_not be_valid
    end

    it "is invalid without installation_date" do

      station = Station.create({name: "PooTown",
                            dock_count: 15,
                            city_id: 1})
      expect(station).to_not be_valid
    end
  end

  describe "total stations" do

    it "returns total number of stations" do

      station = Station.create({name: "PooTown",
                                dock_count: 15,
                                city_id: 1,
                                installation_date: "8/12/13"})
      station = Station.create({name: "Burlingame",
                                dock_count: 11,
                                city_id: 3,
                                installation_date: "8/12/13"})
      result = Station.total_stations
      expect(result).to eq(2)
    end
  end

  describe "average bikes available per station" do
    it "returns the average number of bikes per station" do

      station = Station.create({name: "PooTown",
                                dock_count: 15,
                                city_id: 1,
                                installation_date: "8/12/13"})
      station = Station.create({name: "Burlingame",
                                dock_count: 11,
                                city_id: 3,
                                installation_date: "8/12/13"})
      result = Station.average_bikes_per_station
      expect(result).to eq(13)
    end
  end

  describe "most bikes available at a station" do
    it "returns the most bikes available at a station" do

      station = Station.create({name: "PooTown",
                                dock_count: 15,
                                city_id: 1,
                                installation_date: "8/12/13"})
      station = Station.create({name: "Burlingame",
                                dock_count: 11,
                                city_id: 3,
                                installation_date: "8/12/13"})
      result = Station.most_bikes_available_at_station
      expect(result).to eq(15)
    end
  end

  describe "stations where the most bikes are available" do
    it "returns the station(s) name where the most bikes available" do

      station = Station.create({name: "PooTown",
                                dock_count: 15,
                                city_id: 1,
                                installation_date: "8/12/13"})
      station = Station.create({name: "Burlingame",
                                dock_count: 11,
                                city_id: 3,
                                installation_date: "8/12/13"})
      station = Station.create({name: "San Mateo",
                                dock_count: 15,
                                city_id: 4,
                                installation_date: "8/12/12"})
      result = Station.stations_where_the_most_bikes_are_available
      expect(result).to eq(["PooTown", "San Mateo"])
    end
  end

  describe "fewest bikes available at a station" do
    it "returns the fewest number bikes available at a station" do

      station = Station.create({name: "PooTown",
                                dock_count: 15,
                                city_id: 1,
                                installation_date: "8/12/13"})
      station = Station.create({name: "Burlingame",
                                dock_count: 11,
                                city_id: 3,
                                installation_date: "8/12/13"})
      result = Station.fewest_bikes_available_at_station
      expect(result).to eq(11)
    end
  end

  describe "stations where the fewest bikes are available" do
    it "returns the station(s) name where the fewest bikes available" do

      station = Station.create({name: "PooTown",
                                dock_count: 15,
                                city_id: 1,
                                installation_date: "8/12/13"})
      station = Station.create({name: "Burlingame",
                                dock_count: 11,
                                city_id: 3,
                                installation_date: "8/12/13"})
      station = Station.create({name: "San Mateo",
                                dock_count: 11,
                                city_id: 4,
                                installation_date: "8/12/12"})
      result = Station.stations_where_the_fewest_bikes_are_available
      expect(result).to eq(["Burlingame", "San Mateo"])
    end
  end

  describe "most recently installed stations" do
    it "returns the station that was most recently installed" do

      station = Station.create({name: "PooTown",
                                dock_count: 15,
                                city_id: 1,
                                installation_date: "8/12/16"})
      station = Station.create({name: "Burlingame",
                                dock_count: 11,
                                city_id: 3,
                                installation_date: "8/12/13"})
      station = Station.create({name: "San Mateo",
                                dock_count: 11,
                                city_id: 4,
                                installation_date: "8/12/12"})
      result = Station.newest_station
      expect(result).to eq(["PooTown"])
    end
  end

  describe "oldest stations" do
    it "returns the station(s) that were installed earliest" do

      station = Station.create({name: "PooTown",
                                dock_count: 15,
                                city_id: 1,
                                installation_date: "8/12/16"})
      station = Station.create({name: "Burlingame",
                                dock_count: 11,
                                city_id: 3,
                                installation_date: "8/12/13"})
      station = Station.create({name: "San Mateo",
                                dock_count: 11,
                                city_id: 4,
                                installation_date: "8/12/12"})
      result = Station.oldest_station
      expect(result).to eq(["San Mateo"])
    end
  end

end
