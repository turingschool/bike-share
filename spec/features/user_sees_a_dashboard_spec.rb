  describe "When a user visits the URI '/'" do
    it "they see welcome message" do
      visit '/'

      within("h1") do
        expect(page).to have_content("Welcome to BikeShare!")
      end
    end

    it "they see multiple links" do
      visit '/'

      expect(has_link?("All Stations")).to eq(true)
      expect(has_link?("Add Station")).to eq(true)
      expect(has_link?("All Trips")).to eq(true)
      expect(has_link?("Add Trip")).to eq(true)
      expect(has_link?("All Conditions")).to eq(true)
      expect(has_link?("Add Condition")).to eq(true)
    end
  end
#
#   describe "when the user clicks on the station name on the stations page" do
#     it "brings the user to a page for that individual station" do
#       Station.create({name: "San Jose Diridon Caltrain Station",
#                       dock_count: 27,
#                       city: "San Jose",
#                       installation_date: "8/6/2013"
#                       })
#       visit '/stations'
#
#       click_link("San Jose Diridon Caltrain Station")
#
#       # save_and_open_page
#
#       has_link?("All Stations")
#       within("h1") do
#         expect(page).to have_content("Diridon Caltrain")
#       end
# #TODO check that button exists
# #likely will fix this once above is figured out
#       expect have_button('/stations/27/edit')
#       expect have_button?('/stations/27')
#     end
#   end
