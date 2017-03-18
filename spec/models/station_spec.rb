require_relative '../spec_helper'

RSpec.describe Station do
  describe "validations" do
    it "should be valid with all attributes" do
      City.create(name:"Chicago")
      station = Station.create(name: "Navy Pier", dock_count: "10", installation_date: "20160203", city_id: 1)

      expect(station).to be_valid
    end

    it "should be invalid without name" do
      City.create(name:"Chicago")
      station = Station.create(dock_count: "10", installation_date: "20160203", city_id: 1)

      expect(station).to_not be_valid
    end

    it "should be invalid without dock_count" do
      City.create(name:"Chicago")
      station = Station.create(name: "Navy Pier", installation_date: "20160203", city_id: 1)

      expect(station).to_not be_valid
    end

    it "should be invalid without city" do
      City.create(name:"Chicago")
      station = Station.create(name: "Navy Pier", dock_count: "10", installation_date: "20160203")

      expect(station).to_not be_valid
    end

    it "should be invalid without installation_date" do
      City.create(name:"Chicago")
      station = Station.create(name: "Navy Pier", dock_count: "10")

      expect(station).to_not be_valid
    end
  end
end
