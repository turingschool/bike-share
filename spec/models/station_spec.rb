require_relative '../spec_helper'

RSpec.describe Station do
  describe "validations" do
    it "should be valid with all attributes" do
      station = Station.new(name: "Navy Pier", dock_count: "10", city: "Chicago", installation_date: "20160203")

      expect(station).to be_valid
    end

    xit "should be invalid without name" do
      station = Station.new(dock_count: "10", city: "Chicago", installation_date: "20160203")

      expect(station).to_not be_valid
    end

    xit "should be invalid without dock_count" do
      station = Station.new(name: "Navy Pier",city: "Chicago", installation_date: "20160203")

      expect(station).to_not be_vali
    end

    xit "should be invalid without city" do
      station = Station.new(name: "Navy Pier", dock_count: "10", installation_date: "20160203")

      expect(station).to_not be_valid
    end

    xit "should be invalid without installation_date" do
      station = Station.new(name: "Navy Pier", dock_count: "10", city: "Chicago")

      expect(station).to_not be_valid
    end
  end
end
