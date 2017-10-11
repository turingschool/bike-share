describe "When a user clicks on station name within station index" do
  it "the user can see information for that individual station" do
    Station.create({name: "San Jose Diridon Caltrain Station",
                    station_id: "10",
                    dock_count: 27,
                    city: "San Jose",
                    installation_date: "8/6/2013"
                    })
    visit '/stations'
    click_link "San Jose Diridon Caltrain Station"

    expect(page).to have_content("Diridon Caltrain")
    expect(page).to have_content(27)
    expect(page).to have_content("2013-06-08")
    expect(page).to have_button("edit")
    expect(page).to have_button("delete")
    expect(page).to have_link("All Stations")
    expect(page).to have_link("BikeShare")
  end
end
