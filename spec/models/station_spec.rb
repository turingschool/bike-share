require "./app/models/station.rb"
require './spec/spec_helper'

RSpec.describe Station do
  describe "Validations" do

    it "is invalid without a name" do
      station = Station.new(dock_count: 5, city: "San Francisco", installation_date: "08/15/2017", lat: 0, long: 0)
      expect(station).to_not be_valid
    end

    it "is invalid without a dock count" do
      station = Station.new(name: "Film Name", city: "San Francisco", installation_date: "08/15/2017", lat: 0, long: 0)
      expect(station).to_not be_valid
    end


    it "is invalid without a city" do
      station = Station.new(name: "Film Name", dock_count: 5, installation_date: "08/15/2017", lat: 0, long: 0)
      expect(station).to_not be_valid
    end

    it "is invalid without a installation date" do
      station = Station.new(name: "Film Name", dock_count: 5, city: "San Francisco", lat: 0, long: 0)
      expect(station).to_not be_valid
    end

    it "is invalid without a latitute" do
      station = Station.new(name: "Film Name", dock_count: 5, city: "San Francisco", installation_date: "08/15/2017", long: 0)
      expect(station).to_not be_valid
    end

    it "is invalid without a longitude" do
      station = Station.new(name: "Film Name", dock_count: 5, city: "San Francisco", installation_date: "08/15/2017", lat: 0)
      expect(station).to_not be_valid
    end

  end

end
