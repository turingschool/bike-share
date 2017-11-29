RSpec.describe Station do
  context "Validations" do
    it "is invalid without name" do
      station = Station.create(dock_count: 20, city: "San Francisco", installation_date: "08/06/2013")

      expect(station).to be_invalid
    end

    it "is invalid without dock count" do
      station = Station.create(name: "Embarcadero", city: "San Francisco", installation_date: "08/06/2013")

      expect(station).to be_invalid
    end

    it "is invalid without city" do
      station = Station.create(name: "Embarcadero", dock_count: 20, installation_date: "08/06/2013")

      expect(station).to be_invalid
    end

    it "is invalid without installation date" do
      station = Station.create(name: "Embacadero", dock_count: 20, city: "San Francisco" )

      expect(station).to be_invalid
    end
  end

  context "Class Methods" do

  end
end
