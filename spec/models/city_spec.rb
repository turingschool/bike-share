require_relative "../spec_helper"

RSpec.describe City do

  describe "validations" do

    it "is valid with attibute" do
      city = City.create(city: "San Francisco")

      expect(city).to be_valid
    end

    it "is invald without name" do
      city = City.create

      expect(city).to_not be_valid
    end

    # it "does not have the same name as any other city" do
    #   city = City.create(name: "San Francisco")
    #
    #   # expect(??).to validate_uniqueness_of: :city
    # end
  end
end
