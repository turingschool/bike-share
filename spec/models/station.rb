require_relative "../spec_helper"

RSpec.describe Station do
  describe ".name" do
    it "returns the names of our stations" do

      Station.create(name: "Phil", age: 22, total_winnings: 3)

      expect(Horse.total_winnings).to eq(82)
    end

    describe "validations" do
    it "is invalid without a name" do
      station = Station.create(dock_count: 3)

      expect(station).to_not be_valid
    end
  end
