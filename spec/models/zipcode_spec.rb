RSpec.describe Zipcode do
  describe "Validations" do
    it "is invalid without a zipcode" do
      zipcode = Zipcode.new(zipcode: nil)

      expect(zipcode).to_not be_valid
    end
  end

  describe "Class methods" do
    describe ".create_zipcode" do
      it "will shorten a zipcode longer than 5 digits" do
        zipcode = "12345678"

        result = Zipcode.create_zipcode(zipcode)

        expect(result.zipcode).to eq(12345)
      end

      it "will lengthen a zipcode shorter than 5 digits" do
        zipcode = "12"

        result = Zipcode.create_zipcode(zipcode)

        expect(result.zipcode).to eq(12000)
      end

      it "will return the zipcode if it is 5 digits" do
        zipcode = "12345"

        result = Zipcode.create_zipcode(zipcode)

        expect(result.zipcode).to eq(12345)
      end
    end
  end
end
