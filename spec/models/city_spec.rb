require_relative '../spec_helper'

RSpec.describe City do
  describe "attributes" do
    it "should have a name" do
      city = City.new(name: "San Jose")

      expect(city).to respond_to(:name)
    end
  end
end