require './spec/spec_helper'

RSpec.describe Station do
  describe "attributes" do
    it "returns value in name column" do
      station = Station.create(name: "MLK Station", dock_count: 19, city: "San Jose", installation_date: "8/6/2013")

      expect(station.name).to eq("MLK Station")
      expect(station.dock_count).to eq(19)
      expect(station.city).to eq("San Jose")
      expect(station.installation_date).to eq("8/6/2013")
    end
  end

  describe "validations" do
    it "is invalid without a name" do
      station_1 = Station.create(dock_count: 19, city: "San Jose", installation_date: "8/6/2013")

      expect(station_1).to_not be_valid
    end

      it "is invalid without a dock count" do
        station_1 = Station.create(name: "MLK Station",city: "San Jose", installation_date: "8/6/2013")

        expect(station_1).to_not be_valid
      end

      it "is invalid without a city" do
        station_1 = Station.create(name: "MLK Station", dock_count: 19, installation_date: "8/6/2013")

        expect(station_1).to_not be_valid
      end

      it "is invalid without an installation_date" do
        station_1 = Station.create(name: "MLK Station", city: "San Jose", dock_count: 19)

        expect(station_1).to_not be_valid
      end
  end

end
