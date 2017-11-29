RSpec.describe Station do
  describe "validations" do
    it "is invalid without a name" do
      binding.pry
      station = Station.new(dock_count: 40, city: "San Francisco", installation_date: 8/6/2013)

      expect(station).to be_invalid
    end
  end

end
