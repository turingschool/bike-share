require './spec/spec_helper'

RSpec.describe City do
  describe "attributes" do
    it "returns value in name column" do
      city = City.create(name: "San Jose")

      expect(city.name).to eq("San Jose")
    end
  end
end
