  describe "When a user visits the URI '/'" do
    it "they see the contents of the homepage/dashboard" do
      visit '/'

      within("h1") do
        expect(page).to have_content("Welcome to BikeShare!")
      end
      expect(page).to have_link("All Stations")
      expect(page).to have_link("Add Station")
      expect(page).to have_link("All Trips")
      expect(page).to have_link("Add Trip")
      expect(page).to have_link("All Conditions")
      expect(page).to have_link("Add Condition")
    end
  end
