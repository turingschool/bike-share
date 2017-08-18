require_relative ""

RSpec.describe Station do
  describe "Validations" do
    it "validations city, name, dock_count, and installation date" do
      date = DateTime.now
      valid_station = Station.create(name: "StationOne", city_id: 1, dock_count: 10, installation_date: date)

      expect(valid_station).to be_valid
    end
  end
end
