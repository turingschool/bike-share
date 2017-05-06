require './spec/spec_helper'

RSpec.describe "when a user edits a station" do
  before do
    Station.create(
                  name: "something",
                  dock_count: 1,
                  city_id: 1,
                  installation_date: Date.strptime("08/30/2013",'%m/%d/%Y'),
                  longitude: -121.9,
                  latitude: 30.7
    )
    visit('/stations/1/edit')
  end

  it "can edit the name" do
    # expect(page).to have_button(".btn-edit")
    # click_button("Edit Station")
    # expect(page).to have_current_path('/stations/1/edit')

    fill_in("station[name]", with: "Else")

    click_button("Update Station")
    save_and_open_page

    expect(page).to have_content("Name: Else")
    expect(page).to have_content("City: City 1")
    expect(page).to have_content("Dock Count: 1")
    expect(page).to have_content("Installation Date: 08/30/2013")
    expect(page).to have_content("Latitude: -1.1")
    expect(page).to have_content("Longitude: 1.1")
    expect(page).to have_current_path('/stations/1')
  end

  it "can edit all fields" do
    # expect(page).to have_button("form .btn-edit")
    # click_button("Edit Station")
    expect(page).to have_current_path('/stations/1/edit')

    fill_in("station[name]", with: "Otro")
    select "City 2", :from => "station[city_id]"
    fill_in("station[dock_count]", with: 3)
    fill_in("station[installation_date]", with: "09/30/2014")
    fill_in("station[latitude]", with: -90)
    fill_in("station[longitude]", with: 90)

    click_button("Update Station")

    expect(page).to have_content("Name: Otro")
    expect(page).to have_content("City: City 2")
    expect(page).to have_content("Dock Count: 3")
    expect(page).to have_content("Installation Date: 09/30/2014")
    expect(page).to have_content("Latitude: -90")
    expect(page).to have_content("Longitude: 90")
    expect(page).to have_current_path('/stations/1')
  end
end
