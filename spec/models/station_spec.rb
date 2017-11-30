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
  end

end
