require './app/models/station'


RSpec.describe Station do
  describe "total count of stations" do
    it "returns total count of all stations" do
      Station.create(name: "Station_1", dock_count: 8, city: "San Fran", installation_date: "8/6/2013")
      Station.create(name: "Station_2", dock_count: 6, city: "San Fran", installation_date: "8/7/2013")

      expect(Station.count).to eq(2)
    end
  end

  
end
