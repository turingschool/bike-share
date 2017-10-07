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
      Station.create({name: "San Jose Diridon Caltrain Station",
                      dock_count: 27,
                      city: "San Jose",
                      installation_date: "8/6/2013"
                      })
      visit '/stations'

      within("h1") do
        expect(page).to have_content("All Stations")
      end
#TODO has_link is not being used yet
      has_link?("San Jose Diridon Caltrain Station")
    end
  end

  describe "when the user clicks on the station name on the stations page" do
    it "brings the user to a page for that individual station" do
      Station.create({name: "San Jose Diridon Caltrain Station",
                      dock_count: 27,
                      city: "San Jose",
                      installation_date: "8/6/2013"
                      })
      visit '/stations'

      click_link("San Jose Diridon Caltrain Station")

      # save_and_open_page

      has_link?("All Stations")
      within("h1") do
        expect(page).to have_content("Diridon Caltrain")
      end
#TODO check that button exists
      expect have_button('/stations/27/edit')
      expect have_button?('/stations/27')
    end
  end

end
