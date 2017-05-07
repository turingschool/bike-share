require_relative '../spec_helper'

RSpec.describe City, :type => :model do
  describe "city attributes" do
    it "must have a name attribute" do
      valid_city = City.create(name: "Denver")
      expect(valid_city).to be_valid

      invalid_city = City.create
      expect(invalid_city).not_to be_valid
    end
  end

  describe "city relationships" do
    it "has many stations" do
      date = Time.parse("08/06/2013")
      city = City.create(name: "Denver")
      station = Station.create(name: "stationicus",
                               dock_count: 42,
                               city: city,
                               date: date)
      expect(city.stations).to include(station)
    end

    it "can find all stations with correlating city_id" do
      city = City.create(name: 'Denver')
      Station.create(name: 'Station X',
                     dock_count: 22,
                     city_id: city.id,
                     date: '12/16/1997')
      expect(City.query_stations(city.id)).to be_instance_of(Array)
    end
  end
end
