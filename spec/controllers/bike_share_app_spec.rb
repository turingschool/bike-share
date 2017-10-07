describe BikeShareApp do

  describe "the route '/'" do
    it "gets you to the station index view" do
      visit '/'

      within("h1") do
        expect(page).to have_content("Welcome to BikeShare!")
      end
      has_link?("All Stations")
    end
  end

  describe "the route '/stations'" do
    it "gets you to the view with all stations listed" do
      visit '/stations'

      save_and_open_page

      within("h1") do
        expect(page).to have_content("All Stations")
      end
    end
  end

end
