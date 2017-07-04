RSpec.describe Zipcode do
  describe "Validations" do
    it "is invalid without a zipcode" do
      zipcode = Zipcode.new(zipcode: nil)

      expect(zipcode).to_not be_valid
    end
  end
end
