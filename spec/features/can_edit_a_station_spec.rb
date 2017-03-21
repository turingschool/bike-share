require_relative "../spec_helper"

RSpec.describe "Editing a station from all station index" do
  it "Can click button and be taken to corresponding page" do
    City.create(name: "Chicago")
    Station.create(name: "Navy Pier", city_id: 1, dock_count: "12", installation_date: "20150505")
    visit "/stations"

    click_on "Edit Station"

    expect(current_path).to eq("/stations/1/edit")
  end

  xit "Can edit a stations attributes" do
    City.create(name: "Chicago")
    Station.create(name:"Navy Pier", dock_count:"12", city_id: 1, installation_date: "20170101")
    visit "/stations/1/edit"

    fill_in "station[name]", with: "Main Street"
    fill_in "station[dock_count]", with:"12"
    fill_in "city[name]", with:"Chicago"
    fill_in "station[installation_date]", with: "20170101"

    click_on "Submit"

    expect(current_path).to eq("/stations/1")

    expect(page).to have_content("Main Street")
  end
end
