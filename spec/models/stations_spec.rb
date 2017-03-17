require_relative "../spec_helper"
RSpec.describe Station do
  describe "validations" do
    it "is invalid without a name" do
      station = Station.new(dock_count: 100, city: "Denver", installation_date: "3/14/2017")
      expect( station ).to_not be_valid
    end
    it "should be valid with a name" do
      station = Station.new(name: "Turing", dock_count: 100, city: "Denver", installation_date: "3/14/2017")
      expect( station ).to be_valid
    end
  end
  # describe "attributes" do
  #   it "should have name, age, and total_winnings" do
  #     horse = Horse.new
  #     expect(horse).to respond_to(:name)
  #     expect(horse).to respond_to(:age)
  #     expect(horse).to respond_to(:total_winnings)
  #   end
  # end
end
