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

      save_and_open_page

      within("h1") do
        expect(page).to have_content("All Stations")
      end
      has_link?("San Jose Diridon Caltrain Station")
    end
  end

end
