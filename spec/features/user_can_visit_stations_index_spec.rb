describe "When a user visits '/' and clicks on 'All stations'" do
  it "the user can see the station index page containing all stations" do
    Station.create({name: "San Jose Diridon Caltrain Station",
                    station_id: "10",
                    dock_count: 27,
                    city: "San Jose",
                    installation_date: "8/6/2013"
                    })
    Station.create({name: "Union Station",
                    station_id: "21",
                    dock_count: 31,
                    city: "Denver",
                    installation_date: "10/10/2017"
                    })

    visit '/'
    click_link "All Stations"

    expect(page).to have_content("All Stations")
    expect(page).to have_content("Denver")
    expect(page).to have_content(31)
    expect(page).to have_button("edit")
    expect(page).to have_button("delete")
    expect(page).to have_link("San Jose Diridon Caltrain Station")
    expect(page).to have_link("BikeShare")
  end
end
