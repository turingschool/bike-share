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

        zipcode_id = Zipcode.create_zipcode(zipcode)
        result = Zipcode.find(zipcode_id)

        expect(result.zipcode).to eq("12345")
      end

      it "will lengthen a zipcode shorter than 5 digits" do
        zipcode = "12"

        zipcode_id = Zipcode.create_zipcode(zipcode)
        result = Zipcode.find(zipcode_id)

        expect(result.zipcode).to eq("00012")
      end

      it "will return the zipcode if it is 5 digits" do
        zipcode = "12345"

        zipcode_id = Zipcode.create_zipcode(zipcode)
        result = Zipcode.find(zipcode_id)

        expect(result.zipcode).to eq("12345")
      end

      it "will return zeros if the zipcode is nil" do
        zipcode = nil

        zipcode_id = Zipcode.create_zipcode(zipcode)
        result = Zipcode.find(zipcode_id)

        expect(result.zipcode).to eq("00000")
      end
    end
  end
end
