require_relative '../spec_helper'

RSpec.describe Bike do
  describe "attributes" do
    it "should have a trips and bike_number" do
      bike = Bike.new(bike_number: 2)
      expect(bike).to respond_to(:bike_number, :trips)
    end
  end

  describe "validations" do
    it "is invalid without a bike number" do
      bike = Bike.new

      expect(bike).to_not be_valid
    end
  end
end