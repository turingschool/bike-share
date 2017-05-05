require_relative '../spec_helper'

RSpec.describe Station do
  describe "creating a station" do
    it "allows the user to fill out a form to create a station" do
      visit("/stations/new")
      fill_in "name", with: "stationicus"
      fill_in "dock_count", with: "42"
      fill_in "city", with: "Denver"
      fill_in "installation_date", with: "8/6/2013"
      binding.pry
      click_on "Submit"

      expect(page).to have_content("stationicus")
      # expect(page).to have_current_path("stations/new")
    end

  end
end


# RSpec.describe Horse do
#   describe "#total_winnings" do
#     it "returns total winnings for all horses" do
#       Horse.create(name: "Phil", age: 22, total_winnings: 3)
#       Horse.create(name: "Penelope", age: 24, total_winnings: 4)
#
#       expect(Horse.total_winnings).to eq(7)
#     end
#   end
#   it "is invalid without a name" do
#     horse = Horse.new(age: 22, total_winnings: 14)
#
#     expect(horse).to_not be_valid
#   end
# end
