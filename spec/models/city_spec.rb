RSpec.describe City do
  describe "Validations" do
    it "city is valid with name" do
      valid_city = City.create(name: "San Francisco")

      expect(valid_city).to be_valid
    end

    it "city is invalid without a name" do
      invalid_city = City.create

      expect(invalid_city).to_not be_valid
    end
  end
end
