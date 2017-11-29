RSpec.describe Station do 
  describe "Validations" do 
    it "is invalid without a name" do 
      station = Station.new(dock_count: 2, city: "SF", installation_date: "10-20-2013")
      expect(station).to be_invalid
    end 
  end
end