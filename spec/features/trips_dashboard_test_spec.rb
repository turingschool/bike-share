require_relative '../spec_helper'
RSpec.describe "when a user chooses does one of the following" do
  it "returns the station with the most rides as a starting place" do
    Station.create(date: "2/2/2012",
                    name: "Golden Gate",
                    dock_count: 15,
                    city: "San Francisco",
                    installation_date: "2/18/2010",
    visit "/trips-dashboard"
    click_button('Most ridden bike with total number of rides for that bike:')
    expect(page).not_to have_content(10000)
    expect(page).to have_content(0.0)
  end
end

  it "Least ridden bike with total number of rides for that bike" do
    Station.create(date: "3/3/1013",
                    name: "Golden Gate",
                    dock_count: 20,
                    city: "San Francisco",
                    installation_date: "2/18/2010",
    visit "/trips-dashboard"
    click_button('Least ridden bike with total number of rides for that bike:')
    expect(page).not_to have_content(1)
    expect(page).to have_content(0.0)
  end
end

    it "User subscription type breakout with both count and percentage" do
      Station.create(date: "4/4/2014",
                      name: "Golden Gate",
                      dock_count: 30,
                      city: "San Francisco",
                      installation_date: "2/18/2010",
      visit "/trips-dashboard"
      click_button('User subscription type breakout with both count and percentage:')
      expect(page).not_to have_content(100000)
      expect(page).to have_content(0.0)
      expect(page).not_to have_content(200000)
      expect(page).to have_content(0.0)
      end
    end

    it "Single date with the highest number of trips with a count of those trips" do
      Station.create(date: "2/2/2012",
                      name: "Golden Gate",
                      dock_count: 40,
                      city: "San Francisco",
                      installation_date: "2/18/2010",
      visit "/trips-dashboard"
      click_button('User subscription type breakout with both count and percentage:')
      expect(page).not_to have_content(100000)
      expect(page).to have_content(0.0)
      end
    end

    it "Single date with the lowest number of trips with a count of those trips:" do
      Station.create(date: "2/2/2012",
                      name: "Golden Gate",
                      dock_count: 50,
                      city: "San Francisco",
                      installation_date: "2/18/2010",
      visit "/trips-dashboard"
      click_button('Single date with the lowest number of trips with a count of those trips:')
      expect(page).not_to have_content(100000)
      expect(page).to have_content(1/1/2015)

      end
    end

    it "Single date with the lowest number of trips with a count of those trips:" do
      Station.create(date: "2/2/2012",
                      name: "Golden Gate",
                      dock_count: 50,
                      city: "San Francisco",
                      installation_date: "2/18/2010",
      visit "/trips-dashboard"
      click_button('Single date with the lowest number of trips with a count of those trips:')
      expect(page).not_to have_content(100000)
      expect(page).to have_content(3/2/2015)
      end
    end

    it "Weather on the day with the highest rides" do
      Station.create(date: "2/2/2012",
                      name: "Golden Gate",
                      dock_count: 50,
                      city: "San Francisco",
                      installation_date: "2/18/2010",
      visit "/trips-dashboard"
      click_button('Weather on the day with the highest rides:')
      expect(page).not_to have_content(100000)
      expect(page).to have_content("100 Degrees")

      end
    end

    it "Weather on the day with the lowest rides" do
      Station.create(date: "2/2/2012",
                      name: "Golden Gate",
                      dock_count: 50,
                      city: "San Francisco",
                      installation_date: "2/18/2010",
      visit "/trips-dashboard"
      click_button('Weather on the day with the lowest rides:')
      expect(page).not_to have_content(100000)
      expect(page).to have_content("0 Degrees")
      end
    end
