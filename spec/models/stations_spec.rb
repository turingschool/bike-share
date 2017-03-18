require_relative "../spec_helper"
RSpec.describe Station do
  describe "validations" do
    it "is invalid without a name" do
      station = Station.new(dock_count: 100, city: "Denver", installation_date: "3/14/2017")
      expect(station).to_not be_valid
    end
    it "should be valid with a name" do
      station = Station.new(name: "Turing", dock_count: 100, city: "Denver", installation_date: "3/14/2017")
      expect(station).to be_valid
    end

    it "is invalid without a city" do
      station = Station.new(name: "Turing", dock_count: 100, installation_date: "3/14/2017")
      expect(station).to_not be_valid
    end
    it "should be valid with a city" do
      station = Station.new(name: "Turing", dock_count: 100, city: "Denver", installation_date: "3/14/2017")
      expect(station).to be_valid
    end

    it "is invalid without a dock count" do
      station = Station.new(name: "Turing", city: "Denver", installation_date: "3/14/2017")
      expect(station).to_not be_valid
    end
    it "should be valid with a dock count" do
      station = Station.new(name: "Turing", dock_count: 100, city: "Denver", installation_date: "3/14/2017")
      expect(station).to be_valid
    end

    it "is invalid without an installation date" do
      station = Station.new(name: "Turing", dock_count: 100, city: "Denver")
      expect(station).to_not be_valid
    end
    it "should be valid with an installation date" do
      station = Station.new(name: "Turing", dock_count: 100, city: "Denver", installation_date: "3/14/2017")
      expect(station).to be_valid
    end
  end

  describe "attributes" do
    it "should have name, city, dock count, and an installation date" do
      station = Station.new
      expect(station).to respond_to(:name)
      expect(station).to respond_to(:city)
      expect(station).to respond_to(:dock_count)
      expect(station).to respond_to(:installation_date)
    end
  end
end
