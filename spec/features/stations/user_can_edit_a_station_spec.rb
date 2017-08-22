require './app/models/station'

RSpec.describe "User visits /stations/:id/edit" do
  it "when visiting /stations" do
    station = Station.create(name: "Station_1",
                            dock_count: 20,
                            city: "bike town",
                            installation_date: "2017-08-04")

    visit "/stations/#{station.id}"

    expect(page).to have_content("Station_1")
    click_on("Edit this station")

    fill_in("station[name]", with: "Station_edit")
    fill_in("station[dock_count]", with: 30)
    fill_in("station[city]", with: "cityville")
    fill_in("station[installation_date]", with: "2017-08-05")
    click_on("edit")

    expect(page).to have_content("Station_edit")
    expect(page).to have_content(30)
    expect(page).to have_content("cityville")
    expect(page).to have_content("2017-08-05")

  end
end
