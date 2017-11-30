require 'spec_helper'

RSpec.describe Station do
  describe "validations" do
    it "is invalid without a name" do
      station = Station.create(dock_count: 40, city: "San Francisco", installation_date: 8/6/2013)

      expect(station).to be_invalid
    end

    it "is invalid without a dock count" do
      station = Station.new(name: "Japantown", city: "San Francisco", installation_date: 8/6/2013)

      expect(station).to be_invalid
    end

    it "is invalid without a city" do
      station = Station.new(name: "Japantown", dock_count: 40, installation_date: 8/6/2013)

      expect(station).to be_invalid
    end

    it "is invalid without an installation_date" do
      station = Station.new(name: "Japantown", dock_count: 40, city: "San Francisco")

      expect(station).to be_invalid
    end

    it "is valid with all the requisite information" do
      Station.create(name: "San Jose Diridon Caltrain Station", dock_count: 27, city: "San Jose", installation_date: "1/8/2013")
      Station.create(name: "MLK Library", dock_count: 13, city: "San Jose", installation_date: "5/8/2013")
      Station.create(name: "Clay at Battery", dock_count: 15, city: "San Francisco", installation_date: "12/8/2013")

      expect(Station.all.count).to eql(3)
    end
  end

  describe "class methods" do
    it "can find average bikes" do
      Station.create(name: "San Jose Diridon Caltrain Station", dock_count: 27, city: "San Jose", installation_date: "1/8/2013")
      Station.create(name: "MLK Library", dock_count: 13, city: "San Jose", installation_date: "5/8/2013")
      Station.create(name: "Clay at Battery", dock_count: 15, city: "San Francisco", installation_date: "12/8/2013")

      expect(Station.average_bikes_per_station).to eql(18)
    end

    it "can find most bikes" do
      Station.create(name: "San Jose Diridon Caltrain Station", dock_count: 27, city: "San Jose", installation_date: "1/8/2013")
      Station.create(name: "MLK Library", dock_count: 13, city: "San Jose", installation_date: "5/8/2013")
      Station.create(name: "Clay at Battery", dock_count: 15, city: "San Francisco", installation_date: "12/8/2013")

      expect(Station.most_bikes).to eql(27)
    end

    it "can find station with most bikes" do
      Station.create(name: "San Jose Diridon Caltrain Station", dock_count: 27, city: "San Jose", installation_date: "1/8/2013")
      Station.create(name: "MLK Library", dock_count: 13, city: "San Jose", installation_date: "5/8/2013")
      Station.create(name: "Clay at Battery", dock_count: 15, city: "San Francisco", installation_date: "12/8/2013")

      expect(Station.with_most_bikes.first.name).to eql("San Jose Diridon Caltrain Station")
    end

    it "can find fewest bikes" do
      Station.create(name: "San Jose Diridon Caltrain Station", dock_count: 27, city: "San Jose", installation_date: "1/8/2013")
      Station.create(name: "MLK Library", dock_count: 13, city: "San Jose", installation_date: "5/8/2013")
      Station.create(name: "Clay at Battery", dock_count: 15, city: "San Francisco", installation_date: "12/8/2013")

      expect(Station.fewest_bikes).to eql(13)
    end

  end

end
