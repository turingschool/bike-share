require_relative "../spec_helper"
RSpec.describe Station do
  before :each do
    @city = City.create(name: "Denver")
  end

  describe "validations" do
    it "is invalid without a name" do
      station = @city.stations.new(dock_count: 100, installation_date: "14/3/2017")
      expect(station).to_not be_valid
    end

    it "is invalid without a city" do
      station = Station.new(name: "Turing", dock_count: 100, installation_date: "14/3/2017")
      expect(station).to_not be_valid
    end

    it "is invalid without a dock count" do
      station = @city.stations.new(name: "Turing", installation_date: "14/3/2017")
      expect(station).to_not be_valid
    end

    it "is invalid without an installation date" do
      station = @city.stations.new(name: "Turing", dock_count: 100)
      expect(station).to_not be_valid
    end

    it "should be valid with a name, city, dock_count, and installation_date" do
      station = @city.stations.new(name: "Turing", dock_count: 100, installation_date: "14/3/2017")
      expect(station).to be_valid
    end
  end
  
  describe "relationships" do
    it "returns stations when city is created from station" do
      Station.create(name: "Memorial Union", dock_count: 100, installation_date: "14/3/2017", city_id: 1)
      expect(@city.stations.first.name).to eq("Memorial Union") 
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
