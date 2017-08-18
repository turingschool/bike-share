RSpec.describe Station do
  describe "Validations" do
    it "is invalid without a name" do
      station = Station.create(dock_count: 15)

      expect(station).to_not be_valid
    end
  end
end