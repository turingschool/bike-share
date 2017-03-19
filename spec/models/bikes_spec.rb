require_relative "../spec_helper"
RSpec.describe Bike do
  before :each do
    @bike = Bike.create(bike_number: 33)
  end
  
  describe "validations" do
    it "is invalid without a bike number" do
      bike = Bike.create

      expect(bike).to_not be_valid
    end
    
    it "is valid with bike number" do
      expect(@bike).to be_valid
    end
  end
    
  describe "attributes" do
    it "should have bike number" do
      expect(@bike).to respond_to(:bike_number)
    end
  end
end