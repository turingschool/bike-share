RSpec.describe Station do
  describe "Validations" do
    it 'is invalid without a name' do
      station1 = Station.new(dock_count: 27, city: "San Jose", installation_date: "8/15/13")

      expect(station1).to_not be_valid
    end
  end



end
