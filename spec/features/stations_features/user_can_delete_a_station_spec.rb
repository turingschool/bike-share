require './spec/spec_helper'

RSpec.describe "When a user clicks delete" do

  it "deletes on the index" do
    city_1 = City.create(name: "squeevillia")
    Station.create(
                  name: "Something",
                  dock_count: 1,
                  city_id: 1,
                  installation_date: Date.strptime("03/18/2014", "%m/%d/%Y"),
                  longitude: -90.34,
                  latitude: 34.64
    )

    visit('/stations')
    expect(page).to have_button("Delete")
    expect(Station.all.count).to eq(1)
    click_button("Delete")

    expect(Station.all.count).to eq(0)
    expect(page).to have_current_path("/stations")
    expect(page).to have_content("No stations available.")
  end

  it "deletes on the edit page" do
    city_1 = City.create(name: "squeevillia")
    Station.create(
                  name: "Something",
                  dock_count: 1,
                  city_id: 1,
                  installation_date: Date.strptime("03/18/2014", "%m/%d/%Y"),
                  longitude: -90.34,
                  latitude: 34.64
    )

    visit('/stations/1/edit')
    expect(page).to have_button("Delete")
    expect(Station.all.count).to eq(1)
    click_button("Delete")

    expect(Station.all.count).to eq(0)
    expect(page).to have_current_path("/stations")
  end

  it "deletes on the show page" do
    city_1 = City.create(name: "squeevillia")
    Station.create(
                  name: "Something",
                  dock_count: 1,
                  city_id: 1,
                  installation_date: Date.strptime("03/18/2014", "%m/%d/%Y"),
                  longitude: -90.34,
                  latitude: 34.64
    )

    visit('/stations/1')
    expect(page).to have_button("Delete")
    expect(Station.all.count).to eq(1)
    expect(page).to have_content("Name: Something")
    click_button("Delete")

    expect(Station.all.count).to eq(0)
    expect(page).to have_current_path("/stations")
  end
end
