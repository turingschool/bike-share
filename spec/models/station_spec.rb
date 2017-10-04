# rake db:test:prepare

RSpec.describe Station do
  describe 'Class Methods' do
  end
  describe "Validates" do
    it "existence of name" do
      station = Station.create(dock_count: 27, city: "SF", installation_date: "2014-08-06")

      expect(station).to_not be_valid
    end

    it "existence of dock_count" do
      station = Station.create(name: "cool stuff", city: "SF", installation_date: "2014-08-06")

      expect(station).to_not be_valid
    end

    it "existence of city" do
      station = Station.create(name: "cool stuff", dock_count: 27, installation_date: "2014-08-06")

      expect(station).to_not be_valid
    end

    it "existence of installation date" do
      station = Station.create(name: "cool stuff", dock_count: 27, city: "SF")

      expect(station).to_not be_valid
    end
  end
end