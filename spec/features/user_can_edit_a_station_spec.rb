require './spec/spec_helper'

RSpec.describe "when a user edits a station" do
  before do
    city_1 = City.create(name: "squeevillia")
    city_2 = City.create(name: "rhondarhiffic")
    city_3 = City.create(name: "chrissable")
    city_4 = City.create(name: "adamtastic")
    Station.create(
                  name: "something",
                  dock_count: 1,
                  city_id: 1,
                  installation_date: Date.strptime("08/30/2013",'%m/%d/%Y'),
                  longitude: 1.1,
                  latitude: -1.1
    )

  end

  it "can edit the name" do
    visit('/stations/1/edit')

    fill_in("station[name]", with: "Else")
    select "adamtastic", :from => "station[city_id]"
    fill_in("station[dock_count]", with: 3)
    fill_in("station[installation_date]", with: "09/30/2014")
    fill_in("station[latitude]", with: -90)
    fill_in("station[longitude]", with: 90)

    click_button("Update Station")

    expect(page).to have_content("Name: Else")
    expect(page).to have_content("City: adamtastic")
    expect(page).to have_content("Dock Count: 3")
    expect(page).to have_content("Installation Date: 09/30/2014")
    expect(page).to have_content("Latitude: -90")
    expect(page).to have_content("Longitude: 90")
    expect(page).to have_current_path('/stations/1')
  end
end
