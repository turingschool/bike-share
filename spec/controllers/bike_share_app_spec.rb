describe BikeShareApp do

  describe "the route '/'" do
    it "gets you to the station index view" do
      visit '/'

      within("h1") do
        expect(page).to have_content("Welcome to BikeShare!")
      end
      expect(has_link?("All Stations")).to eq(true)
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
      within("a") do
        has_link?("San Jose Diridon Caltrain Station")
      end
#TODO are my tests written correctly??
# => What is convention?
# => What parts of these tests are Capybara
# => What parts of these tests are RSpec
#TODO test below does not work?????
#form is not unique
# => change html?
# => change test?
# => use first("form")???
      # require 'pry'; binding.pry
      expect(has_button?("edit")).to be(true)
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
#likely will fix this once above is figured out
      expect have_button('/stations/27/edit')
      expect have_button?('/stations/27')
    end
  end

end
