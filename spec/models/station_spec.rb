# rake db:test:prepare

RSpec.describe Station do
  context 'Class Methods' do
  end
  context "Validates" do
    before do
      City.create(name: 'cool town')
    end

    it "creates a city given valid params" do
      station = City.first.stations.create(name: 'whatever', dock_count: 27, installation_date: "2014-08-06")
      expect(station).to be_valid
    end

    it "existence of name" do
      station = City.first.stations.create(dock_count: 27, installation_date: "2014-08-06")

      expect(station).to_not be_valid
    end

    it "existence of dock_count" do
      station = City.first.stations.create(name: "cool stuff", installation_date: "2014-08-06")

      expect(station).to_not be_valid
    end

    it "existence of installation date" do
      station = City.first.stations.create(name: "cool stuff", dock_count: 27)

      expect(station).to_not be_valid
    end
  end
end