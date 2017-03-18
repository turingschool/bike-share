require_relative '../spec_helper'

RSpec.describe Station do
  describe "attributes" do
    it "should have a name, dock_count, city_id, installation_date" do
      station = Station.new(name: "union station", dock_count: 12, city_id: 1, installation_date: 2/14/2014)

      expect(station).to respond_to(:name, :dock_count, :city_id, :installation_date)
    end
  end

  describe "validations" do
    it "is invalid without a name" do
      station = Station.new(dock_count: 12, city_id: 1, installation_date: 2/14/2014)

      expect(station).to_not be_valid
    end

    it "is invalid without a dock_count" do
      station = Station.new(name: "Union Station", city_id: 1, installation_date: 2/14/2014)

      expect(station).to_not be_valid
    end

    it "is invalid without a city_id" do
      station = Station.new(name: "Union Station", dock_count: 12, installation_date: 2/14/2014)

      expect(station).to_not be_valid
    end

    it "is invalid without a installation_date" do
      station = Station.new(name: "Union Station", dock_count: 12, city_id: 1)

      expect(station).to_not be_valid
    end
  end
end