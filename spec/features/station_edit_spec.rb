require './app/models/station'

RSpec.describe "User visits /stations/:id/edit" do
  it "when visiting /stations" do
    station = Station.create(name: "Station_1",
                          dock_count: 20,
                          city: "bike town",
                          installation_date: "3/2/15")

    visit "stations/#{station.id}"

    expect(page).to have_content("Station_1")
    click_on("Edit this station")

    fill_in("station[name]", with: "Station_edit")
    click_on("edit")

    expect(page).to have_content("Station_edit")
  end
end
