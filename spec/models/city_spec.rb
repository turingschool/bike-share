describe City do
  describe "Validations" do
    it "is invalid without a city" do
      city = City.create

      expect(city).to_not be_valid
    end
  end
end