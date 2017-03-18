require_relative "../spec_helper"

RSpec.describe Station do

  describe "validations" do

    it "is valid with all attributes" do

      station = Station.create({name: "PooTown",
                    dock_count: 15,
                    city_id: 1,
                    installation_date: "8/12/13"})
      expect(station).to be_valid
    end

    it "is invalid without name" do

      station = Station.create({dock_count: 15,
                            city_id: 1,
                            installation_date: "8/12/13"})
      expect(station).to_not be_valid
    end

    it "is invalid without dock_count" do

      station = Station.create({name: "PooTown",
                            city_id: 1,
                            installation_date: "8/12/13"})
      expect(station).to_not be_valid
    end

    it "is invalid without installation_date" do

      station = Station.create({name: "PooTown",
                            dock_count: 15,
                            city_id: 1})
      expect(station).to_not be_valid
    end
  end
end
